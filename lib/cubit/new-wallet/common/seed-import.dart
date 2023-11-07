import 'package:bip39/bip39.dart' as bip39;
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libstackmate/libstackmate.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';

part 'seed-import.freezed.dart';

enum SeedImportStep {
  passphrase,
  import,
}

enum ImportTypes { words12, words24 }

@freezed
class SeedImportState with _$SeedImportState {
  const factory SeedImportState({
    @Default([]) List<({String word, bool tapped})> words12,
    @Default([]) List<({String word, bool tapped})> words24,
    @Default(SeedImportStep.import) SeedImportStep currentStep,
    @Default(ImportTypes.words12) ImportTypes importType,
    @Default('') String err,
    @Default(false) bool loading,
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

  bool showSeedCompleteButton() => bip39.validateMnemonic(seed);
}

class SeedImportCubit extends Cubit<SeedImportState> {
  SeedImportCubit(
    this.logger,
    this._masterKey,
    this._blockchainCubit,
    this._core,
  ) : super(const SeedImportState()) {
    emit(
      state.copyWith(words12: [...emptyWords12], words24: [...emptyWords24]),
    );
  }

  final IStackMateBitcoin _core;
  final MasterKeyCubit _masterKey;
  final Logger logger;
  final ChainSelectCubit _blockchainCubit;

  static const segwitNativePurpose = '84';
  static const invalidSeedError = 'Invalid Seed Words.';
  static const emptyString = '';
  final emptyWords12 = [
    for (int i = 0; i < 12; i++) (word: '', tapped: false),
  ];

  final emptyWords24 = [
    for (int i = 0; i < 24; i++) (word: '', tapped: false),
  ];

  void backOnPassphaseClicked() {
    emit(
      state.copyWith(
        currentStep: SeedImportStep.import,
        passPhrase: emptyString,
        errPassPhrase: emptyString,
      ),
    );
  }

  void recoverClicked() {
    emit(
      state.copyWith(
        currentStep: SeedImportStep.import,
        importType: ImportTypes.words12,
      ),
    );
  }

  void recoverClicked24() {
    emit(
      state.copyWith(
        currentStep: SeedImportStep.import,
        importType: ImportTypes.words24,
      ),
    );
  }

  void wordChanged12(int idx, String text, bool tapped) {
    final words12 = state.words12.toList();
    words12[idx] = (word: text, tapped: tapped);
    emit(
      state.copyWith(
        words12: words12,
      ),
    );
  }

  void wordChanged24(int idx, String text, bool tapped) {
    final words24 = state.words24.toList();
    words24[idx] = (word: text, tapped: tapped);
    emit(state.copyWith(words24: words24));
  }

  void clearUntappedWords() {
    final words12 = state.words12.toList();
    final words24 = state.words24.toList();

    for (int i = 0; i < words12.length; i++)
      if (!words12[i].tapped) words12[i] = (word: '', tapped: false);

    for (int i = 0; i < words24.length; i++)
      if (!words24[i].tapped) words24[i] = (word: '', tapped: false);

    emit(
      state.copyWith(
        words12: words12,
        words24: words24,
      ),
    );
  }

  void passPhraseChanged(String text) {
    emit(state.copyWith(passPhrase: text));
  }

  void gotoPassPhrase() {
    final type = state.importType;
    switch (type) {
      case ImportTypes.words12:
        recoverWallet12Clicked();
      case ImportTypes.words24:
        recoverWallet24Clicked();
    }
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

  void recoverWallet12Clicked() async {
    emit(
      state.copyWith(
        importType: ImportTypes.words12,
        seedError: '',
      ),
    );
    for (final word in state.words12)
      if (word.word.isEmpty) {
        emit(state.copyWith(seedError: 'Please fill all words'));
        return;
      }
    if (state.seedError.isNotEmpty) return;
    final type = state.importType;

    if (type == ImportTypes.words12) {
      final mnemonic = state.words12.map((_) => _.word).join(' ');
      emit(state.copyWith(seed: mnemonic));
    }
  }

  void recoverWallet24Clicked() async {
    emit(
      state.copyWith(
        importType: ImportTypes.words24,
        seedError: '',
      ),
    );
    for (final word in state.words24)
      if (word.word.isEmpty) {
        emit(state.copyWith(seedError: 'Please fill all words'));
        return;
      }
    if (state.seedError.isNotEmpty) return;
    final type = state.importType;

    if (type == ImportTypes.words24) {
      final mnemonic = state.words24.map((_) => _.word).join(' ');
      emit(state.copyWith(seed: mnemonic));
    }
  }

  Future<void> checkSeed() async {
    try {
      final type = state.importType;
      switch (type) {
        case ImportTypes.words12:
          recoverWallet12Clicked();
        case ImportTypes.words24:
          recoverWallet24Clicked();
      }

      final tseed = state.seed;
      print(tseed);

      if (bip39.validateMnemonic(tseed)) {
        emit(
          state.copyWith(
            seedError: invalidSeedError,
          ),
        );
      }
      // we cannot import a primary key with passphrase - pp wallets can be derived later
      final pp =
          (_masterKey.state.key == null) ? emptyString : state.passPhrase;
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
      print(wallet.result!.fingerPrint);
      if (wallet.hasError) {
        throw SMError.fromJson(wallet.error!).message;
      }

      emit(
        state.copyWith(
          currentStep: SeedImportStep.import,
          seedReady: true,
          masterXpriv: root.result!.xprv,
          wallet: wallet.result,
        ),
      );
    } catch (e, s) {
      emit(state.copyWith(seedError: e.toString()));
      logger.logException(
        e,
        'SeedImportWalletCubit._createNewLocalWallet',
        s,
      );
    }
  }

  void clear() => emit(const SeedImportState());
}
