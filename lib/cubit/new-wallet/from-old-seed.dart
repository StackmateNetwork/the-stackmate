import 'dart:async';

import 'package:bitcoin/types.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
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
    if (currentStep == SeedImportWalletSteps.warning) return true;
    return false;
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
    this._importCubit, {
    String walletLabel = '',
  }) : super(
          SeedImportWalletState(
            walletLabel: walletLabel,
            labelFixed: walletLabel != '',
          ),
        ) {
    _importSub = _importCubit.stream.listen((istate) {
      if (istate.seedReady) {
        emit(state.copyWith(currentStep: SeedImportWalletSteps.label));
      }
    });
  }

  final IStackMateCore _core;

  final IStorage _storage;

  final WalletsCubit _wallets;
  final ChainSelectCubit _blockchainCubit;
  final SeedImportCubit _importCubit;
  late StreamSubscription _importSub;

  static const invalidLabelError = 'Invalid Label';
  static const signerWalletType = 'SIGNER';
  static const wpkhScript = 'wpkh';
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
        _saveClicked();
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

  void _saveClicked() async {
    if (state.walletLabel.length < 3 ||
        state.walletLabel.length > 10 ||
        state.walletLabel.contains(' ')) {
      emit(state.copyWith(walletLabelError: invalidLabelError));
      return;
    }

    emit(state.copyWith(walletLabelError: emptyString));

    final istate = _importCubit.state;
    final wallet = istate.wallet;
    if (wallet == null) return;
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

    // public descriptor
    // Check history and whether this wallet needs to update its address index

    var newWallet = Wallet(
      label: state.walletLabel,
      walletType: signerWalletType,
      descriptor: descriptor.result!,
      policy: readable,
      requiredPolicyElements: 1,
      policyElements: ['primary:$fullXPub'],
      blockchain: _blockchainCubit.state.blockchain.name,
      lastAddressIndex: 0,
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

    _wallets.refresh();

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
