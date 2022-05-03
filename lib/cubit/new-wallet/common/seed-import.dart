import 'package:bitcoin/bitcoin.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';

part 'seed-import.freezed.dart';

enum SeedImportStep {
  passphrase,
  import,
}

@freezed
class SeedImportState with _$SeedImportState {
  const factory SeedImportState({
    @Default(SeedImportStep.passphrase) SeedImportStep currentStep,
    @Default('') String seed,
    @Default('') String seedError,
    @Default('') String passPhrase,
    @Default(0) int accountNumber,
    @Default('') String errPassPhrase,
    @Default(false) bool seedReady,
    String? masterXpriv,
    DerivedKeys? wallet,
  }) = _SeedImportState;
  const SeedImportState._();

  bool showSeedCompleteButton() => seed.split(' ').length == 12;
}

class SeedImportCubit extends Cubit<SeedImportState> {
  SeedImportCubit(
    this.logger,
    this._blockchainCubit,
    this._core,
  ) : super(const SeedImportState());

  final IStackMateCore _core;
  final Logger logger;
  final ChainSelectCubit _blockchainCubit;

  static const segwitNativePurpose = '84';
  static const invalidSeedError = 'Invalid Seed Words.';
  static const emptyString = '';

  void backOnPassphaseClicked() {
    emit(
      state.copyWith(
        currentStep: SeedImportStep.passphrase,
        passPhrase: emptyString,
        errPassPhrase: emptyString,
      ),
    );
  }

  void passPhraseChanged(String text) {
    emit(state.copyWith(passPhrase: text));
  }

  void accountNumberChanged(String number) {
    try {
      final val = int.parse(number);
      emit(state.copyWith(accountNumber: val));
    } catch (e) {
      print(e.toString());
    }
  }

  void checkPassPhrase() {
    emit(
      state.copyWith(
        currentStep: SeedImportStep.import,
        errPassPhrase: emptyString,
      ),
    );
  }

  void backOnSeedClicked() {
    emit(
      state.copyWith(
        currentStep: SeedImportStep.passphrase,
        seed: emptyString,
        seedError: emptyString,
      ),
    );
  }

  void seedTextChanged(String seed) {
    emit(
      state.copyWith(
        seed: seed,
        seedError: emptyString,
      ),
    );
  }

  void checkSeed() {
    try {
      final seed = state.seed;

      if (seed.split(' ').length != 12) {
        emit(state.copyWith(seedError: invalidSeedError));
        return;
      }

      final root = _core.importMaster(
        mnemonic: state.seed,
        passphrase: state.passPhrase,
        network: _blockchainCubit.state.blockchain.name,
      );
      if (root.hasError) {
        throw SMError.fromJson(root.error!);
      }

      final wallet = _core.deriveHardened(
        masterXPriv: root.result!.xprv,
        account: state.accountNumber.toString(),
        purpose: segwitNativePurpose,
      );

      if (wallet.hasError) {
        throw SMError.fromJson(wallet.error!);
      }

      emit(
        state.copyWith(
          seedReady: true,
          masterXpriv: root.result!.xprv,
          wallet: wallet.result,
        ),
      );
    } catch (e, s) {
      logger.logException(
        e,
        'SeedImportWalletCubit._createNewLocalWallet',
        s,
      );
    }
  }

  void clear() => emit(const SeedImportState());
}
