import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/bitcoin_worker.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/pkg/wallet_db.dart';

part 'from-old-seed.freezed.dart';

enum SeedImportWalletSteps { warning, import, label }

@freezed
abstract class SeedImportWalletState with _$SeedImportWalletState {
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
    this._importCubit,
    this._masterKeyCubit, {
    String walletLabel = '',
  }) : super(
         SeedImportWalletState(
           walletLabel: walletLabel,
           labelFixed: walletLabel != emptyString,
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
  final MasterKeyCubit _masterKeyCubit;

  static const invalidLabelError = 'Invalid Label (must be 3-20 chars).';
  static const couldNotSaveError = 'Error Saving Wallet!';

  static const wpkhScript = 'wpkh';
  static const wshScript = 'wsh';
  static const emptyString = '';

  void nextClicked() {
    switch (state.currentStep) {
      case SeedImportWalletSteps.warning:
        emit(
          const SeedImportWalletState(
            currentStep: SeedImportWalletSteps.import,
          ),
        );

      case SeedImportWalletSteps.import:
        if (_masterKeyCubit.state.key != null) {
          emit(
            const SeedImportWalletState(
              currentStep: SeedImportWalletSteps.label,
            ),
          );
        }

      case SeedImportWalletSteps.label:
        if (!state.savingWallet) _saveClicked();
    }
  }

  Future<void> backClicked() async {
    switch (state.currentStep) {
      case SeedImportWalletSteps.warning:
        break;

      case SeedImportWalletSteps.import:
        final importStep = _importCubit.state.currentStep;
        switch (importStep) {
          case SeedImportStep.import:
            emit(const SeedImportWalletState());
            _importCubit.backOnPassphaseClicked();
          case SeedImportStep.passphrase:
            _importCubit.backOnSeedClicked();
        }

      case SeedImportWalletSteps.label:
        emit(
          const SeedImportWalletState(
            currentStep: SeedImportWalletSteps.import,
          ),
        );
        _importCubit.backOnSeedClicked();
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
        state.walletLabel.isEmpty) {
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

      // final fullXPrv =
      //     '[${wallet.fingerPrint}/${wallet.hardenedPath}]${wallet.xprv}'
      //         .replaceFirst('/m', emptyString);

      final fullXPub =
          '[${wallet.fingerPrint}/${wallet.hardenedPath}]${wallet.xpub}'
              .replaceFirst('/m', emptyString);

      final policy = 'pk($fullXPub/*)';

      const readable = 'pk(___primary___)';
      final uid = sha1
          .convert(utf8.encode(wallet.xpub))
          .toString()
          .substring(0, 21);

      final descriptor = _core.compile(policy: policy, scriptType: wpkhScript);
      descriptor.orThrow();

      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();

      final dbPath = await walletDbPath(state.walletLabel, uid);

      final syncStat = await BitcoinWorker.sync(
        dbPath: dbPath,
        descriptor: descriptor.result!,
        nodeAddress: nodeAddress,
        socks5: socks5,
      );
      syncStat.orThrow();

      var history = await BitcoinWorker.history(
        descriptor: descriptor.result!,
        dbPath: dbPath,
      );

      // ignore: unused_local_variable
      var recievedCount = 0;

      if (history.hasError) {
        emit(state.copyWith(savingWalletError: 'Could not fetch history.'));
        history = const R(result: []);
      } else {
        for (final item in history.result!) {
          if (item.sent == 0) {
            recievedCount++;
          }
        }
      }

      var balance = await BitcoinWorker.balance(
        descriptor: descriptor.result!,
        dbPath: dbPath,
      );

      if (balance.hasError) {
        emit(state.copyWith(savingWalletError: 'Could not fetch balance.'));
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
      final needsMasterKey = _masterKeyCubit.state.key == null;

      if (needsMasterKey) {
        await _masterKeyCubit.save(
          root,
          wallet.fingerPrint,
          _importCubit.state.seed,
        );
        await _masterKeyCubit.init();
      } else {
        await _masterKeyCubit.saveRecover(
          root,
          wallet.fingerPrint,
          _importCubit.state.seed,
        );
        await _masterKeyCubit.getRecoverkey(wallet.fingerPrint);
      }
      // Future.delayed(Duration(seconds: 3));
      // public descriptor
      // Check history and whether this wallet needs to update its address index

      final newWallet = Wallet(
        fingerprint: wallet.fingerPrint,
        passPhrase: istate.passPhrase,
        label: state.walletLabel,
        walletType:
            needsMasterKey ? WalletType.primary : WalletType.recovered,
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

      emit(state.copyWith(savingWallet: false, newWalletSaved: true));
      _importCubit.clear();
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

    await _storage.saveItemAt<Wallet>(StoreKeys.Wallet.name, id, newWallet);
    _wallets.refresh();
  }

  @override
  Future<void> close() {
    _importSub.cancel();
    return super.close();
  }
}
