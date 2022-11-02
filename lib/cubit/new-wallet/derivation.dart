import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libstackmate/outputs.dart';
import 'package:path/path.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/api/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
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

part 'derivation.freezed.dart';

enum DeriveWalletStep { purpose, passphrase, label }

enum DerivationPurpose { segwit, taproot, legacy, bip85 }

@freezed
class DeriveWalletState with _$DeriveWalletState {
  const factory DeriveWalletState({
    @Default(DeriveWalletStep.purpose) DeriveWalletStep currentStep,
    @Default(DerivationPurpose.segwit) DerivationPurpose purpose,
    @Default(0) int index,
    @Default('m/0h/0h/0h') String rawPath,
    @Default('') String passPhrase,
    @Default('') String errPassphrase,
    @Default('') String label,
    @Default('') String walletLabelError,
    @Default(false) bool savingWallet,
    @Default('') String errSavingWallet,
    @Default(false) bool newWalletSaved,
  }) = _DeriveWalletState;

  // bool canGoBack() => true;
}

class DeriveWalletCubit extends Cubit<DeriveWalletState> {
  DeriveWalletCubit(
    this._core,
    this._logger,
    this._storage,
    this._wallets,
    this._blockchainCubit,
    this._nodeAddressCubit,
    this._torCubit,
    this._masterKeyCubit,
  ) : super(const DeriveWalletState());

  final Logger _logger;
  final IStorage _storage;
  final IStackMateBitcoin _core;
  final WalletsCubit _wallets;
  final ChainSelectCubit _blockchainCubit;
  final NodeAddressCubit _nodeAddressCubit;
  final TorCubit _torCubit;
  final MasterKeyCubit _masterKeyCubit;

  static const invalidLabelError = 'Invalid Label (must be 3-20 chars)';
  static const internalError = 'Internal Error';
  static const signerWalletType = 'PRIMARY';
  static const trScript = 'tr';
  static const taprootPurpose = '86';
  static const segwitScript = 'wpkh';
  static const segwitPurpose = '84';
  static const emptyString = '';

  void passPhrasedChanged(String text) => emit(
        state.copyWith(
          passPhrase: text,
        ),
      );

  void labelChanged(String text) {
    emit(
      state.copyWith(
        label: text,
        errSavingWallet: emptyString,
        walletLabelError: emptyString,
      ),
    );
  }

  void nextClicked() async {
    switch (state.currentStep) {
      case DeriveWalletStep.purpose:
        emit(state.copyWith(currentStep: DeriveWalletStep.passphrase));
        break;
      case DeriveWalletStep.passphrase:
        emit(state.copyWith(currentStep: DeriveWalletStep.label));
        break;
      case DeriveWalletStep.label:
        if (state.label == emptyString ||
            state.label.length < 3 ||
            state.label.length > 20) {
          emit(state.copyWith(walletLabelError: invalidLabelError));
          return;
        } else {
          emit(state.copyWith(walletLabelError: emptyString));
        }
        if (!state.savingWallet)
          (state.purpose == DerivationPurpose.taproot)
              ? deriveTaproot()
              : deriveSegwit();

        break;
    }
  }

  void purposeChanged(DerivationPurpose purpose) {
    emit(state.copyWith(purpose: purpose));
  }

  void backClicked() {
    switch (state.currentStep) {
      case DeriveWalletStep.purpose:
        break;
      case DeriveWalletStep.passphrase:
        emit(
          state.copyWith(
            currentStep: DeriveWalletStep.purpose,
            label: emptyString,
            errSavingWallet: emptyString,
            walletLabelError: emptyString,
          ),
        );
        break;
      case DeriveWalletStep.label:
        emit(
          state.copyWith(
            currentStep: DeriveWalletStep.passphrase,
            label: emptyString,
            errSavingWallet: emptyString,
            walletLabelError: emptyString,
          ),
        );
        break;
    }
  }

  void deriveTaproot() async {
    try {
      emit(
        state.copyWith(
          savingWallet: true,
          errSavingWallet: emptyString,
          walletLabelError: emptyString,
        ),
      );

      final parent = _core.importMaster(
        mnemonic: _masterKeyCubit.state.key!.seed!,
        passphrase: state.passPhrase,
        network: _blockchainCubit.state.blockchain.name,
      );
      if (parent.hasError) {
        throw SMError.fromJson(parent.error!).message;
      }

      final child = _core.deriveHardened(
        masterXPriv: parent.result!.xprv,
        account: '0',
        purpose: taprootPurpose,
      );

      if (child.hasError) {
        throw SMError.fromJson(child.error!);
      }
      final fingerprint = child.result!.fingerPrint;
      final path = child.result!.hardenedPath;
      final xprv = child.result!.xprv;
      final fullXPrv =
          '[$fingerprint/$path]$xprv'.replaceFirst('/m', emptyString);
      final xpub = child.result!.xpub;
      final fullXPub =
          '[$fingerprint/$path]$xpub'.replaceFirst('/m', emptyString);
      final policy = 'pk($fullXPrv/*)';

      const readable = 'pk(__primary__)';
      final uid = sha1.convert(utf8.encode(xpub)).toString().substring(0, 21);

      final exists = _wallets.state.wallets.any(
        (wallet) => wallet.uid == uid,
      );
      if (exists) {
        throw 'This account already exists.';
      }

      final descriptor = _core.compile(
        policy: policy,
        scriptType: trScript,
      );

      if (descriptor.hasError) {
        throw SMError.fromJson(descriptor.error!).message;
      }

      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();
      final dbName = state.label + uid + '.db';
      final db = await openDatabase(dbName);
      final databasesPath = await getDatabasesPath();
      final dbPath = join(databasesPath, dbName);
      // ensure to delete db if process errors
      final syncStat = await compute(sqliteSync, {
        'dbPath': dbPath,
        'descriptor': descriptor.result!,
        'nodeAddress': nodeAddress,
        'socks5': socks5,
      });
      if (syncStat.hasError) {
        throw SMError.fromJson(syncStat.error!);
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
            errSavingWallet: history.error!,
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
            errSavingWallet: balance.error!,
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
            errSavingWallet: 'Could not set last unused address.',
          ),
        );
      } else {
        lastIndex = int.parse(lastUnused.result!.index);
      }
      // check balance and see if last address index needs update
      var newWallet = Wallet(
        label: state.label,
        descriptor: descriptor.result!,
        policy: readable,
        requiredPolicyElements: 1,
        policyElements: ['primary:$fullXPub'],
        blockchain: _blockchainCubit.state.blockchain.name,
        walletType: signerWalletType,
        lastAddressIndex: lastIndex,
        balance: balance.result!,
        transactions: history.result!,
        uid: uid,
      );

      final savedId = await _storage.saveItem<Wallet>(
        StoreKeys.Wallet.name,
        newWallet,
      );

      if (savedId.hasError) return;

      final id = savedId.result!;

      newWallet = newWallet.copyWith(id: id);

      await _storage.saveItemAt<Wallet>(
        StoreKeys.Wallet.name,
        id,
        newWallet,
      );

      _wallets.walletSelected(newWallet);
      _wallets.addTransactionsToSelectedWallet(history.result!);

      emit(
        state.copyWith(
          savingWallet: false,
          newWalletSaved: true,
        ),
      );
      db.close();
    } catch (e, s) {
      emit(
        state.copyWith(
          errSavingWallet: e.toString(),
          savingWallet: false,
          newWalletSaved: true,
        ),
      );

      _logger.logException(e, 'MasterKeyDeriveCubit._deriveTaproot', s);
    }
  }

  void deriveSegwit() async {
    try {
      emit(
        state.copyWith(
          savingWallet: true,
          errSavingWallet: emptyString,
        ),
      );

      final parent = _core.importMaster(
        mnemonic: _masterKeyCubit.state.key!.seed!,
        passphrase: state.passPhrase,
        network: _blockchainCubit.state.blockchain.name,
      );
      if (parent.hasError) {
        throw SMError.fromJson(parent.error!);
      }

      final child = _core.deriveHardened(
        masterXPriv: parent.result!.xprv,
        account: '0',
        purpose: segwitPurpose,
      );

      if (child.hasError) {
        throw SMError.fromJson(child.error!);
      }
      final fingerprint = child.result!.fingerPrint;
      final path = child.result!.hardenedPath;
      final xprv = child.result!.xprv;
      final fullXPrv =
          '[$fingerprint/$path]$xprv'.replaceFirst('/m', emptyString);
      final xpub = child.result!.xpub;
      final fullXPub =
          '[$fingerprint/$path]$xpub'.replaceFirst('/m', emptyString);
      final policy = 'pk($fullXPrv/*)';

      const readable = 'pk(__primary__)';
      final bytes = utf8.encode(xpub);
      final uid = sha1.convert(bytes).toString().substring(0, 21);
      final exists = _wallets.state.wallets.any(
        (wallet) => wallet.uid == uid,
      );
      if (exists) {
        throw 'This account already exists.';
      }

      final descriptor = _core.compile(
        policy: policy,
        scriptType: segwitScript,
      );

      if (descriptor.hasError) {
        throw SMError.fromJson(descriptor.error!);
      }

      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();
      //for dbName uniqueness
      final pathString =
          path.replaceFirst('m', emptyString).replaceAll('/', emptyString);
      final dbName = state.label + fingerprint + pathString + '.db';
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
        throw SMError.fromJson(syncStat.error!);
      }

      var history = await compute(sqliteHistory, {
        'descriptor': descriptor.result!,
        'dbPath': dbPath,
      });
// ignore: unused_local_variable
      var recievedCount = 0;

      if (history.hasError) {
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
        balance = const R(result: 0);
      }
      final lastUnused = _core.lastUnusedAddress(
        descriptor: descriptor.result!,
        dbPath: dbPath,
      );
      if (lastUnused.hasError) {
        throw SMError.fromJson(lastUnused.error!);
      }
      // check balance and see if last address index needs update
      var newWallet = Wallet(
        label: state.label,
        descriptor: descriptor.result!,
        policy: readable,
        requiredPolicyElements: 1,
        policyElements: ['primary:$fullXPub'],
        blockchain: _blockchainCubit.state.blockchain.name,
        walletType: signerWalletType,
        lastAddressIndex: (recievedCount == 0) ? 0 : recievedCount,
        balance: balance.result!,
        transactions: history.result!,
        uid: uid,
      );

      final savedId = await _storage.saveItem<Wallet>(
        StoreKeys.Wallet.name,
        newWallet,
      );

      if (savedId.hasError) return;

      final id = savedId.result!;

      newWallet = newWallet.copyWith(id: id);

      await _storage.saveItemAt<Wallet>(
        StoreKeys.Wallet.name,
        id,
        newWallet,
      );

      _wallets.walletSelected(newWallet);
      _wallets.addTransactionsToSelectedWallet(history.result!);

      emit(
        state.copyWith(
          savingWallet: false,
          newWalletSaved: true,
        ),
      );
      db.close();
    } catch (e, s) {
      emit(
        state.copyWith(
          errSavingWallet: e.toString(),
          savingWallet: false,
          newWalletSaved: true,
        ),
      );

      _logger.logException(e, 'MasterKeyDeriveCubit._deriveTaproot', s);
    }
  }
}

Future<R<List<Transaction>>> computeHistory(dynamic obj) async {
  final data = obj as Map<String, String?>;
  final resp = LibBitcoin().getHistory(
    descriptor: data['descriptor']!,
    nodeAddress: data['nodeAddress']!,
    socks5: obj['socks5']!,
  );

  return resp;
}

Future<R<int>> computeBalance(dynamic obj) async {
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

  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp;
}

R<Address> getLastUnusedAddress(dynamic msg) {
  final data = msg as Map<String, String?>;
  final resp = LibBitcoin().lastUnusedAddress(
    descriptor: data['descriptor']!,
    dbPath: data['dbPath']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
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
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp;
}
