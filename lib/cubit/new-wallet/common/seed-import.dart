import 'package:bip39/bip39.dart' as bip39;
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libstackmate/libstackmate.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/pkg/mnemonic_word.dart';

part 'seed-import.freezed.dart';

enum SeedImportStep {
  passphrase,
  import,
}

@freezed
class SeedImportState with _$SeedImportState {
  const factory SeedImportState({
    @Default(SeedImportStep.import) SeedImportStep currentStep,
    @Default('') String err,
    @Default(false) bool loading,
    List<String>? words,
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

  List<String> findWords(String str) {
    if (str.isEmpty) return [];

    final w = words!
        .where(
          (word) => word.startsWith(
            str,
          ),
        )
        .toList();

    return w.length > 3 ? w.sublist(0, 3) : w;
  }

  bool showSeedCompleteButton() => bip39.validateMnemonic(seed);
}

class SeedImportCubit extends Cubit<SeedImportState> {
  SeedImportCubit(
    this.logger,
    this._masterKey,
    this._blockchainCubit,
    this._core,
    this.mnemonicWords,
  ) : super(const SeedImportState()) {
    loadWords();
  }

  final IStackMateBitcoin _core;
  final MasterKeyCubit _masterKey;
  final Logger logger;
  final ChainSelectCubit _blockchainCubit;
  final MnemonicWords mnemonicWords;

  static const segwitNativePurpose = '84';
  static const invalidSeedError = 'Invalid Seed Words.';
  static const emptyString = '';

  Future<void> loadWords() async {
    emit(state.copyWith(loading: true));
    final words = await mnemonicWords.loadWordList();
    if (words.result != null) {
      emit(state.copyWith(err: words.error.toString(), loading: false));
      return;
    }
    emit(state.copyWith(words: words.result, loading: false));
  }

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

  void seedTextChanged(String text) {
    emit(
      state.copyWith(
        seed: text,
        seedError: emptyString,
      ),
    );
  }

  Future<void> checkSeed() async {
    try {
      final tseed = state.seed;
      //print(seed);

      if (bip39.validateMnemonic(tseed)) {
        emit(
          state.copyWith(
            seedError: invalidSeedError,
          ),
        );
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
