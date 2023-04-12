import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libstackmate/outputs.dart';
import 'package:path/path.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/api/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/transaction.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sqflite/sqflite.dart' hide Transaction;

part 'from-old-seed.freezed.dart';

enum SeedImportWalletSteps {
  warning,
  import,
  label,
}

@freezed
class SeedImportWalletState with _$SeedImportWalletState {
  const factory SeedImportWalletState({
    @Default(SeedImportWalletSteps.warning) SeedImportWalletSteps currentStep,
    @Default('') String walletLabel,
    @Default('') String walletLabelError,
    @Default(false) bool savingWallet,
    @Default('') String savingWalletError,
    @Default(false) bool newWalletSaved,
    @Default(false) bool labelFixed,
  }) = _SeedImportWalletState;
  const SeedImportWalletState._();

  bool showWalletConfirmButton() {
    if (walletLabel.length > 4) return true;
    return false;
  }

  bool canGoBack() {
    // if (currentStep == SeedImportWalletSteps.warning)
    return true;
    // return false;
  }

  double completePercent() =>
      currentStep.index / SeedImportWalletSteps.values.length;

  String completePercentLabel() =>
      ((currentStep.index / SeedImportWalletSteps.values.length) * 100)
          .toStringAsFixed(0);

  String currentStepLabel() {
    switch (currentStep) {
      case SeedImportWalletSteps.warning:
        return 'Instructions';

      case SeedImportWalletSteps.import:
        return 'Enter Seed';

      // case SeedImportWalletSteps.passphrase:
      //   return 'Extra Details';

      case SeedImportWalletSteps.label:
        return 'Label Wallet';
    }
  }
}

class SeedImportWalletCubit extends Cubit<SeedImportWalletState> {
  SeedImportWalletCubit(
    this._core,
    this._logger,
    this._storage,
    this._wallets,
    this._blockchainCubit,
    this._nodeAddressCubit,
    this._torCubit,
    this._importCubit, {
    String walletLabel = '',
  }) : super(
          SeedImportWalletState(
            walletLabel: walletLabel,
            labelFixed: walletLabel != emptyString,
            walletLabelError: emptyString,
            savingWalletError: emptyString,
          ),
        ) {
    _importSub = _importCubit.stream.listen((istate) {
      if (istate.seedReady) {
        emit(state.copyWith(currentStep: SeedImportWalletSteps.label));
      }
    });
  }
  final Logger _logger;

  final IStackMateBitcoin _core;

  final IStorage _storage;

  final WalletsCubit _wallets;
  final ChainSelectCubit _blockchainCubit;
  final SeedImportCubit _importCubit;
  late StreamSubscription _importSub;
  final NodeAddressCubit _nodeAddressCubit;
  final TorCubit _torCubit;

  static const invalidLabelError = 'Invalid Label (must be 3-20 chars).';
  static const couldNotSaveError = 'Error Saving Wallet!';
  static const signerWalletType = 'PRIMARY';
  static const importWalletType = 'RECOVERED';

  static const wpkhScript = 'wpkh';
  static const wshScript = 'wsh';
  static const emptyString = '';
  final storage = const FlutterSecureStorage();
  void nextClicked() async {
    final root = await storage.read(key: 'root');
    switch (state.currentStep) {
      case SeedImportWalletSteps.warning:
        emit(
          const SeedImportWalletState(
            currentStep: SeedImportWalletSteps.import,
          ),
        );
        break;

      case SeedImportWalletSteps.import:
        if (root != null)
          emit(
            const SeedImportWalletState(
              currentStep: SeedImportWalletSteps.label,
            ),
          );
        break;

      case SeedImportWalletSteps.label:
        if (!state.savingWallet) _saveClicked();
        break;
    }
  }

  void backClicked() async {
    switch (state.currentStep) {
      case SeedImportWalletSteps.warning:
        break;

      case SeedImportWalletSteps.import:
        final importStep = _importCubit.state.currentStep;
        switch (importStep) {
          case SeedImportStep.import:
            emit(
              const SeedImportWalletState(
                currentStep: SeedImportWalletSteps.warning,
                walletLabelError: emptyString,
                savingWalletError: emptyString,
              ),
            );
            _importCubit.backOnPassphaseClicked();
            break;
          case SeedImportStep.passphrase:
            _importCubit.backOnSeedClicked();
            break;
        }
        break;

      case SeedImportWalletSteps.label:
        emit(
          const SeedImportWalletState(
            currentStep: SeedImportWalletSteps.import,
            walletLabelError: emptyString,
            savingWalletError: emptyString,
          ),
        );
        _importCubit.backOnSeedClicked();
        break;
    }
  }

  void labelChanged(String text) {
    emit(
      state.copyWith(
        walletLabel: text,
        walletLabelError: emptyString,
        savingWalletError: emptyString,
      ),
    );
  }

  Future<void> _saveClicked() async {
    if (state.walletLabel.length < 3 ||
        state.walletLabel.length > 20 ||
        state.walletLabel == emptyString) {
      emit(
        state.copyWith(
          walletLabelError: invalidLabelError,
          savingWalletError: emptyString,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        savingWallet: true,
        savingWalletError: emptyString,
        walletLabelError: emptyString,
      ),
    );
    try {
      final istate = _importCubit.state;
      final wallet = istate.wallet;
      if (wallet == null) return;

      final root = _importCubit.state.masterXpriv!;

      final fullXPrv =
          '[${wallet.fingerPrint}/${wallet.hardenedPath}]${wallet.xprv}'
              .replaceFirst('/m', emptyString);

      final fullXPub =
          '[${wallet.fingerPrint}/${wallet.hardenedPath}]${wallet.xpub}'
              .replaceFirst('/m', emptyString);

      final policy = 'pk($fullXPrv/*)';

      const readable = 'pk(___primary___)';
      final uid =
          sha1.convert(utf8.encode(wallet.xpub)).toString().substring(0, 21);

      final descriptor = _core.compile(
        policy: policy,
        scriptType: wpkhScript,
      );
      if (descriptor.hasError) {
        throw SMError.fromJson(descriptor.error!).message;
      }

      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();

      final dbName = state.walletLabel + uid + '.db';
      final db = await openDatabase(dbName);

      final databasesPath = await getDatabasesPath();
      final dbPath = join(databasesPath, dbName);

      final syncStat = await compute(sqliteSync, {
        'dbPath': dbPath,
        'descriptor': descriptor.result!,
        'nodeAddress': nodeAddress,
        'socks5': socks5,
      });
      if (syncStat.hasError) {
        throw SMError.fromJson(syncStat.error!).message;
      }

      var history = await compute(sqliteHistory, {
        'descriptor': descriptor.result!,
        'dbPath': dbPath,
      });

      // ignore: unused_local_variable
      var recievedCount = 0;

      if (history.hasError) {
        emit(
          state.copyWith(
            savingWalletError: 'Could not fetch history.',
          ),
        );
        history = const R(result: []);
      } else
        for (final item in history.result!) {
          if (item.sent == 0) {
            recievedCount++;
          }
        }

      var balance = await compute(sqliteBalance, {
        'descriptor': descriptor.result!,
        'dbPath': dbPath,
      });

      if (balance.hasError) {
        emit(
          state.copyWith(
            savingWalletError: 'Could not fetch balance.',
          ),
        );
        balance = const R(result: 0);
      }
      final lastUnused = _core.lastUnusedAddress(
        descriptor: descriptor.result!,
        dbPath: dbPath,
      );
      var lastIndex = 0;
      if (lastUnused.hasError) {
        emit(
          state.copyWith(
            savingWalletError: 'Could not set last unused address.',
          ),
        );
      } else {
        lastIndex = int.parse(lastUnused.result!.index);
      }
      final needsMasterKey = await storage.read(key: 'root');

      // Future.delayed(Duration(seconds: 3));
      // public descriptor
      // Check history and whether this wallet needs to update its address index

      final newWallet = Wallet(
        label: state.walletLabel,
        walletType:
            needsMasterKey!.isNotEmpty ? signerWalletType : importWalletType,
        descriptor: descriptor.result!,
        policy: readable,
        requiredPolicyElements: 1,
        policyElements: ['primary:$fullXPub'],
        blockchain: _blockchainCubit.state.blockchain.name,
        lastAddressIndex: lastIndex,
        balance: balance.result!,
        transactions: history.result!,
        uid: uid,
      );

      updateWalletStorage(newWallet);

      emit(
        state.copyWith(
          savingWallet: false,
          newWalletSaved: true,
        ),
      );
      _importCubit.clear();
      db.close();
    } catch (e, s) {
      _logger.logException(e, 'SeedImportCubit._saveWallet', s);

      emit(
        state.copyWith(
          savingWalletError: e.toString(),
          savingWallet: false,
          newWalletSaved: false,
        ),
      );
    }
  }

  // Future<void> updateWalletStorage(Wallet wallet) async {
  //   await _storage.saveItemAt<Wallet>(
  //       StoreKeys.Wallet.name, wallet.id!, wallet);
  //   _wallets.update(wallet);
  // }
  Future<void> updateWalletStorage(Wallet wallet) async {
    final savedid = await _storage.saveItem<Wallet>(
      StoreKeys.Wallet.name,
      wallet,
    );
    if (savedid.hasError) throw couldNotSaveError;

    final id = savedid.result!;

    final newWallet = wallet.copyWith(id: id);

    await _storage.saveItemAt<Wallet>(
      StoreKeys.Wallet.name,
      id,
      newWallet,
    );
    _wallets.refresh();
  }

  @override
  Future<void> close() {
    _importSub.cancel();
    return super.close();
  }
}

R<List<Transaction>> computeHistory(dynamic obj) {
  final data = obj as Map<String, String?>;
  final resp = LibBitcoin().getHistory(
    descriptor: data['descriptor']!,
    nodeAddress: data['nodeAddress']!,
    socks5: obj['socks5']!,
  );

  return resp;
}

R<int> computeBalance(dynamic obj) {
  final data = obj as Map<String, String?>;
  final resp = LibBitcoin().syncBalance(
    descriptor: data['descriptor']!,
    nodeAddress: data['nodeAddress']!,
    socks5: obj['socks5']!,
  );

  return resp;
}

R<int> sqliteBalance(dynamic obj) {
  final data = obj as Map<String, String?>;
  final resp = LibBitcoin().sqliteBalance(
    descriptor: data['descriptor']!,
    dbPath: data['dbPath']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp;
}

R<List<Transaction>> sqliteHistory(dynamic obj) {
  final data = obj as Map<String, String?>;
  final resp = LibBitcoin().sqliteHistory(
    descriptor: data['descriptor']!,
    dbPath: data['dbPath']!,
  );

  return resp;
}

R<Address> getLastUnusedAddress(dynamic msg) {
  final data = msg as Map<String, String?>;
  final resp = LibBitcoin().lastUnusedAddress(
    descriptor: data['descriptor']!,
    dbPath: data['dbPath']!,
  );

  return resp;
}

R<String> sqliteSync(dynamic obj) {
  final data = obj as Map<String, String?>;
  final resp = LibBitcoin().sqliteSync(
    dbPath: obj['dbPath']!,
    descriptor: data['descriptor']!,
    nodeAddress: data['nodeAddress']!,
    socks5: obj['socks5']!,
  );
  return resp;
}
