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
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/pkg/wallet_db.dart';

part 'from-old-xpub.freezed.dart';

enum XpubImportWalletStep { import, label }

@freezed
abstract class XpubImportWalletState with _$XpubImportWalletState {
  const factory XpubImportWalletState({
    @Default(XpubImportWalletStep.import) XpubImportWalletStep currentStep,
    @Default('') String label,
    @Default(false) bool savingWallet,
    @Default('') String errSavingWallet,
    @Default(false) bool newWalletSaved,
  }) = _SeedImportXpubState;
  const XpubImportWalletState._();

  double completePercent() =>
      currentStep.index / XpubImportWalletStep.values.length;

  String completePercentLabel() =>
      ((currentStep.index / XpubImportWalletStep.values.length) * 100)
          .toStringAsFixed(0);

  String currentStepLabel() {
    switch (currentStep) {
      case XpubImportWalletStep.import:
        return 'Import XPub';
      case XpubImportWalletStep.label:
        return 'Label Wallet';
    }
  }

  bool canGoBack() => currentStep == XpubImportWalletStep.import;
}

class XpubImportWalletCubit extends Cubit<XpubImportWalletState> {
  XpubImportWalletCubit(
    // this._soloWalletAPI,
    this._core,
    this._logger,
    this._storage,
    this._wallets,
    this._blockchainCubit,
    this._nodeAddressCubit,
    this._torCubit,
    this._importCubit,
  ) : super(const XpubImportWalletState()) {
    _importSub = _importCubit.stream.listen((istate) {
      if (istate.detailsReady) {
        emit(state.copyWith(currentStep: XpubImportWalletStep.label));
      }
    });
  }

  final Logger _logger;
  final IStorage _storage;
  final IStackMateBitcoin _core;
  final WalletsCubit _wallets;
  final ChainSelectCubit _blockchainCubit;
  final NodeAddressCubit _nodeAddressCubit;
  final TorCubit _torCubit;
  final XpubImportCubit _importCubit;

  late StreamSubscription _importSub;

  static const invalidLabelError = 'Invalid Label (must be 3-20 chars).';
  static const internalError = 'Internal Error';
  static const wpkhScript = 'wpkh';
  static const trScript = 'tr';
  static const emptyString = '';
  static const couldNotSaveError = 'Error Saving Wallet!';

  void labelChanged(String text) {
    emit(state.copyWith(label: text, errSavingWallet: emptyString));
  }

  Future<void> nextClicked() async {
    switch (state.currentStep) {
      case XpubImportWalletStep.import:
        break;

      case XpubImportWalletStep.label:
        if (state.label.isEmpty ||
            state.label.length < 3 ||
            state.label.length > 20) {
          emit(state.copyWith(errSavingWallet: invalidLabelError));
          return;
        }
        if (!state.savingWallet) _saveWallet();
    }
  }

  void backClicked() {
    switch (state.currentStep) {
      case XpubImportWalletStep.import:
        _importCubit.clear();
      case XpubImportWalletStep.label:
        emit(
          state.copyWith(
            currentStep: XpubImportWalletStep.import,
            label: emptyString,
            errSavingWallet: emptyString,
          ),
        );
    }
  }

  Future<void> _saveWallet() async {
    emit(state.copyWith(savingWallet: true, errSavingWallet: emptyString));

    try {
      final xpubState = _importCubit.state;
      final fingerprint = xpubState.fingerPrint;
      final path = xpubState.path;
      final xpub = xpubState.xpub;
      String fullXPub = xpub.replaceFirst('/*', emptyString);

      if (xpubState.hasNoKeySource()) {
        fullXPub = '[$fingerprint/$path]$xpub'.replaceFirst('/m', emptyString);
      }

      final policy = 'pk($fullXPub/*)';

      const readable = 'pk(__primary__)';
      final uid = sha1.convert(utf8.encode(xpub)).toString().substring(0, 21);

      // fix this using Validation.extractPathFromPolicy
      final scriptType = policy.contains('/84h/')
          ? wpkhScript
          : policy.contains('/86h/')
          ? trScript
          : 'error';
      if (scriptType == 'error') {
        throw 'Only Segwit 84h and Taproot 86h purpose paths are allowd.';
      }

      final descriptor = _core.compile(policy: policy, scriptType: scriptType);

      descriptor.orThrow();

      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();

      final dbPath = await walletDbPath(state.label, uid);

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
        emit(state.copyWith(errSavingWallet: 'Could not fetch history.'));
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
        emit(state.copyWith(errSavingWallet: 'Could not fetch balance.'));
        balance = const R(result: 0);
      }
      final lastUnused = _core.lastUnusedAddress(
        descriptor: descriptor.result!,
        dbPath: dbPath,
      );
      var lastIndex = 0;
      if (lastUnused.hasError) {
        emit(
          state.copyWith(errSavingWallet: 'Could not set last unused address.'),
        );
      } else {
        lastIndex = int.parse(lastUnused.result!.index);
      }

      // check balance and see if last address index needs update
      final newWallet = Wallet(
        fingerprint: fingerprint,
        passPhrase: emptyString,
        label: state.label,
        descriptor: descriptor.result!,
        policy: readable,
        requiredPolicyElements: 1,
        policyElements: ['primary:$fullXPub'],
        blockchain: _blockchainCubit.state.blockchain.name,
        walletType: WalletType.watcher,
        lastAddressIndex: lastIndex,
        balance: balance.result!,
        transactions: history.result!,
        uid: uid,
      );

      updateWalletStorage(newWallet);

      emit(state.copyWith(savingWallet: false, newWalletSaved: true));
    } catch (e, s) {
      _logger.logException(e, 'SeedXpubCubit._saveWallet', s);

      emit(
        state.copyWith(errSavingWallet: e.toString(), newWalletSaved: false),
      );
    }
  }

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
