import 'dart:async';

import 'package:bitcoin/types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/interface/stackmate-core.dart';
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

@freezed
class SeedGenerateWalletState with _$SeedGenerateWalletState {
  const factory SeedGenerateWalletState({
    @Default(SeedGenerateWalletSteps.warning)
        SeedGenerateWalletSteps currentStep,
    @Default('') String walletLabel,
    @Default('') String walletLabelError,
    @Default(false) bool savinngWallet,
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
    return false;
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

  final IStackMateCore _core;

  final IStorage _storage;
  final Logger _logger;

  final WalletsCubit _wallets;
  final ChainSelectCubit _blockchainCubit;
  final SeedGenerateCubit _generateCubit;
  late StreamSubscription _generateSub;

  static const invalidLabelError = 'Invalid Label';
  static const signerWalletType = 'SIGNER';
  static const wpkhScript = 'wpkh';
  static const emptyString = '';

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

        break;

      case SeedGenerateWalletSteps.label:
        break;
    }
  }

  void nextClicked() {
    switch (state.currentStep) {
      case SeedGenerateWalletSteps.warning:
        emit(state.copyWith(currentStep: SeedGenerateWalletSteps.generate));
        break;

      case SeedGenerateWalletSteps.generate:
        break;

      case SeedGenerateWalletSteps.label:
        saveClicked();
        break;
    }
  }

  void labelChanged(String text) {
    emit(state.copyWith(walletLabel: text, walletLabelError: emptyString));
  }

  void saveClicked() async {
    if (state.walletLabel.length < 3 ||
        state.walletLabel.length > 10 ||
        state.walletLabel.contains(' ')) {
      emit(state.copyWith(walletLabelError: invalidLabelError));
      return;
    }

    try {
      final wallet = _generateCubit.state.wallet;
      if (wallet == null) return;

      final fullXPrv =
          '[${wallet.fingerPrint}/${wallet.hardenedPath}]${wallet.xprv}';

      final fullXPub =
          '[${wallet.fingerPrint}/${wallet.hardenedPath}]${wallet.xpub}'
              .replaceFirst('/m', emptyString);

      final policy = 'pk($fullXPrv/*)'.replaceFirst('/m', emptyString);

      const readable = 'pk(___primary___)';

      final descriptor = _core.compile(
        policy: policy,
        scriptType: wpkhScript,
      );
      if (descriptor.hasError) {
        throw SMError.fromJson(descriptor.error!);
      }

      var newWallet = Wallet(
        label: state.walletLabel,
        walletType: signerWalletType,
        descriptor: descriptor.result!,
        policy: readable,
        requiredPolicyElements: 1,
        policyElements: [
          'primary:$fullXPub',
        ],
        blockchain: _blockchainCubit.state.blockchain.name,
        lastAddressIndex: 0,
      );

      final savedid = await _storage.saveItem<Wallet>(
        StoreKeys.Wallet.name,
        newWallet,
      );
      if (savedid.hasError) return;

      final id = savedid.result!;

      newWallet = newWallet.copyWith(id: id);

      await _storage.saveItemAt<Wallet>(
        StoreKeys.Wallet.name,
        id,
        newWallet,
      );

      _wallets.refresh();
      emit(
        state.copyWith(
          savingWalletError: emptyString,
          savinngWallet: false,
          newWalletSaved: true,
        ),
      );
    } catch (e, s) {
      final error = e;
      print(error);
      _logger.logException(
        e,
        'SeedGenerateWalletCubit._createNewLocalWallet',
        s,
      );
    }
  }

  @override
  Future<void> close() {
    _generateSub.cancel();
    return super.close();
  }
}
