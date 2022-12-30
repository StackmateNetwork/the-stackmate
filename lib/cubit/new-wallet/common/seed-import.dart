import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libstackmate/libstackmate.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/social-root.dart';

part 'seed-import.freezed.dart';

enum SeedImportStep {
  passphrase,
  import,
}

@freezed
class SeedImportState with _$SeedImportState {
  const factory SeedImportState({
    @Default(SeedImportStep.import) SeedImportStep currentStep,
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

  bool showSeedCompleteButton() =>
      seed.split(' ').length >= 12 && seed.split(' ').length <= 24;
}

class SeedImportCubit extends Cubit<SeedImportState> {
  SeedImportCubit(
    this.logger,
    this._masterKey,
    this._blockchainCubit,
    this._core,
  ) : super(const SeedImportState());

  final IStackMateBitcoin _core;
  final MasterKeyCubit _masterKey;
  final Logger logger;
  final ChainSelectCubit _blockchainCubit;
  
  static const segwitNativePurpose = '84';
  static const invalidSeedError = 'Invalid Seed Words.';
  static const emptyString = '';

  void backOnPassphaseClicked() {
    emit(
      state.copyWith(
        currentStep: SeedImportStep.import,
        passPhrase: emptyString,
        errPassPhrase: emptyString,
      ),
    );
  }

  void passPhraseChanged(String text) {
    emit(state.copyWith(passPhrase: text));
  }

  void gotoPassPhrase() {
    emit(
      state.copyWith(
        currentStep: SeedImportStep.passphrase,
        errPassPhrase: emptyString,
      ),
    );
  }

  void backOnSeedClicked() {
    emit(
      state.copyWith(
        currentStep: SeedImportStep.import,
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

  Future<void> checkSeed() async {
    try {
      final seed = state.seed;

      if (seed.split(' ').length < 12 || seed.split(' ').length > 24) {
        emit(state.copyWith(seedError: invalidSeedError));
        return;
      }
      // we cannot import a primary key with passphrase - pp wallets can be derived later
      final pp =
          (_masterKey.state.key != null) ? emptyString : state.passPhrase;
      final root = _core.importMaster(
        mnemonic: state.seed,
        passphrase: pp,
        network: _blockchainCubit.state.blockchain.name,
      );
      if (root.hasError) {
        throw SMError.fromJson(root.error!).message;
      }

      final wallet = _core.deriveHardened(
        masterXPriv: root.result!.xprv,
        account: state.accountNumber.toString(),
        purpose: segwitNativePurpose,
      );

      if (wallet.hasError) {
        throw SMError.fromJson(wallet.error!).message;
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
