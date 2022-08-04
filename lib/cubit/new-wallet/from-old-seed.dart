import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libstackmate/outputs.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/api/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/master.dart';
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

  final IStackMateBitcoin _core;

  final IStorage _storage;

  final WalletsCubit _wallets;
  final ChainSelectCubit _blockchainCubit;
  final SeedImportCubit _importCubit;
  late StreamSubscription _importSub;
  final NodeAddressCubit _nodeAddressCubit;
  final TorCubit _torCubit;
  final MasterKeyCubit _masterKeyCubit;

  static const invalidLabelError = 'Invalid Label';
  static const signerWalletType = 'PRIMARY';
  static const recoveryWalletType = 'RECOVERED';

  static const wpkhScript = 'wpkh';
  static const wshScript = 'wsh';
  static const emptyString = '';

  void nextClicked() async {
    switch (state.currentStep) {
      case SeedImportWalletSteps.warning:
        emit(
          const SeedImportWalletState(
            currentStep: SeedImportWalletSteps.import,
          ),
        );
        break;

      case SeedImportWalletSteps.import:
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
          case SeedImportStep.passphrase:
            emit(
              const SeedImportWalletState(
                currentStep: SeedImportWalletSteps.warning,
              ),
            );
            _importCubit.backOnPassphaseClicked();
            break;
          case SeedImportStep.import:
            _importCubit.backOnSeedClicked();
            break;
        }
        break;

      case SeedImportWalletSteps.label:
        emit(
          const SeedImportWalletState(
            currentStep: SeedImportWalletSteps.import,
          ),
        );
        _importCubit.backOnSeedClicked();
        break;
    }
  }

  void labelChanged(String text) {
    emit(state.copyWith(walletLabel: text, walletLabelError: ''));
  }

  Future<void> _saveClicked() async {
    if (state.walletLabel.length <= 3 ||
        state.walletLabel.length > 20 ||
        state.walletLabel == emptyString) {
      emit(state.copyWith(walletLabelError: invalidLabelError));
      return;
    }
    emit(
      state.copyWith(
        savingWallet: true,
      ),
    );

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

    final descriptor = _core.compile(
      policy: policy,
      scriptType: wpkhScript,
    );
    if (descriptor.hasError) {
      throw SMError.fromJson(descriptor.error!);
    }

    final nodeAddress = _nodeAddressCubit.state.getAddress();
    final socks5 = _torCubit.state.getSocks5();

    var history = await compute(computeHistory, {
      'descriptor': descriptor.result!,
      'nodeAddress': nodeAddress,
      'socks5': socks5,
    });

    var recievedCount = 0;

    if (history.hasError) {
      history = const R(result: []);
    } else
      for (final item in history.result!) {
        if (item.sent == 0) {
          recievedCount++;
        }
      }

    var balance = await compute(computeBalance, {
      'descriptor': descriptor.result!,
      'nodeAddress': nodeAddress,
      'socks5': socks5,
    });

    if (balance.hasError) {
      balance = const R(result: 0);
    }

    final needsMasterKey = _masterKeyCubit.state.key == null;

    if (needsMasterKey) {
      await _masterKeyCubit.save(
        root,
        wallet.fingerPrint,
      );
      _masterKeyCubit.init();
    }
    // Future.delayed(Duration(seconds: 3));
    // public descriptor
    // Check history and whether this wallet needs to update its address index

    var newWallet = Wallet(
      label: state.walletLabel,
      walletType: needsMasterKey ? signerWalletType : recoveryWalletType,
      descriptor: descriptor.result!,
      policy: readable,
      requiredPolicyElements: 1,
      policyElements: ['primary:$fullXPub'],
      blockchain: _blockchainCubit.state.blockchain.name,
      lastAddressIndex: (recievedCount == 0) ? 0 : recievedCount,
      balance: balance.result!,
      transactions: history.result!,
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

    if (state.labelFixed) {
      emit(state.copyWith(newWalletSaved: true));
      return;
    }
    _wallets.walletSelected(newWallet);
    _wallets.addTransactionsToSelectedWallet(history.result!);

    emit(
      state.copyWith(
        savingWallet: false,
        newWalletSaved: true,
      ),
    );
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
