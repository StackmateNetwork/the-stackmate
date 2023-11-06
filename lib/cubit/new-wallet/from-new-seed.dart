import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libstackmate/outputs.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'from-new-seed.freezed.dart';

enum SeedGenerateWalletSteps {
  warning,
  generate,
  label,
}

const invalidLabelError = 'Invalid Label (must be 3-20 chars)';
const couldNotSaveError = 'Error Saving Wallet!';
const primaryWalletType = 'PRIMARY';
const signerWalletType = 'SIGNER';
const wpkhScript = 'wpkh';
const emptyString = '';

@freezed
class SeedGenerateWalletState with _$SeedGenerateWalletState {
  const factory SeedGenerateWalletState({
    @Default(SeedGenerateWalletSteps.warning)
    SeedGenerateWalletSteps currentStep,
    @Default('') String walletLabel,
    @Default('') String walletLabelError,
    @Default(false) bool savingWallet,
    @Default('') String savingWalletError,
    @Default(false) bool newWalletSaved,
  }) = _SeedGenerateWalletState;
  const SeedGenerateWalletState._();

  bool showWalletConfirmButton() {
    if (walletLabel.length > 4) return true;
    return false;
  }

  bool canGoBack() {
    if (currentStep == SeedGenerateWalletSteps.warning) return true;
    return true;
  }

  double completePercent() =>
      currentStep.index / SeedGenerateWalletSteps.values.length;

  String completePercentLabel() =>
      ((currentStep.index / SeedGenerateWalletSteps.values.length) * 100)
          .toStringAsFixed(0);
}

class SeedGenerateWalletCubit extends Cubit<SeedGenerateWalletState> {
  SeedGenerateWalletCubit(
    this._core,
    this._storage,
    this._logger,
    this._wallets,
    this._blockchainCubit,
    this._generateCubit,
  ) : super(const SeedGenerateWalletState()) {
    _generateSub = _generateCubit.stream.listen((gstate) {
      if (gstate.wallet != null) {
        emit(state.copyWith(currentStep: SeedGenerateWalletSteps.label));
      }
    });
  }

  final IStackMateBitcoin _core;
  final IStorage _storage;
  final Logger _logger;
  final WalletsCubit _wallets;
  final ChainSelectCubit _blockchainCubit;
  final SeedGenerateCubit _generateCubit;
  late StreamSubscription _generateSub;

  void backClicked() {
    switch (state.currentStep) {
      case SeedGenerateWalletSteps.warning:
        break;

      case SeedGenerateWalletSteps.generate:
        emit(
          state.copyWith(
            currentStep: SeedGenerateWalletSteps.warning,
          ),
        );
        _generateCubit.clear();

      case SeedGenerateWalletSteps.label:
        break;
    }
  }

  void nextClicked() {
    switch (state.currentStep) {
      case SeedGenerateWalletSteps.warning:
        emit(state.copyWith(currentStep: SeedGenerateWalletSteps.generate));
        _generateCubit.generateSeed();

      case SeedGenerateWalletSteps.generate:
        emit(state.copyWith(currentStep: SeedGenerateWalletSteps.label));

      case SeedGenerateWalletSteps.label:
        if (!state.savingWallet) saveClicked();
    }
  }

  void labelChanged(String text) {
    emit(state.copyWith(walletLabel: text, walletLabelError: emptyString));
  }

  void saveClicked() async {
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

    try {
      emit(
        state.copyWith(
          savingWallet: true,
          walletLabelError: emptyString,
          savingWalletError: emptyString,
        ),
      );

      final wallet = _generateCubit.state.wallet;
      if (wallet == null) throw 'No wallet in state. Contact support.';

      // final fullXPrv =
      //     '[${wallet.fingerPrint}/${wallet.hardenedPath}]${wallet.xprv}';
      final fingerprint = wallet.fingerPrint;
      final fullXPub =
          '[${wallet.fingerPrint}/${wallet.hardenedPath}]${wallet.xpub}'
              .replaceFirst('/m', emptyString);

      final policy = 'pk($fullXPub/*)'.replaceFirst('/m', emptyString);

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

      final newWallet = Wallet(
        fingerprint: fingerprint,
        passPhrase: emptyString,
        label: state.walletLabel,
        walletType: primaryWalletType,
        descriptor: descriptor.result!,
        policy: readable,
        requiredPolicyElements: 1,
        policyElements: [
          'primary:$fullXPub',
        ],
        blockchain: _blockchainCubit.state.blockchain.name,
        lastAddressIndex: 0,
        balance: 0,
        transactions: [],
        uid: uid,
      );

      await updateWalletStorage(newWallet);

      _generateCubit.clear();

      emit(
        state.copyWith(
          walletLabelError: emptyString,
          savingWalletError: emptyString,
          savingWallet: false,
          newWalletSaved: true,
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          walletLabelError: emptyString,
          savingWalletError: e.toString(),
          savingWallet: false,
          newWalletSaved: false,
        ),
      );
      _logger.logException(
        e,
        'SeedGenerateWalletCubit._createNewLocalWallet',
        s,
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

    await _storage.saveItemAt<Wallet>(
      StoreKeys.Wallet.name,
      id,
      newWallet,
    );
    _wallets.refresh();
  }

  @override
  Future<void> close() {
    _generateSub.cancel();
    return super.close();
  }
}
