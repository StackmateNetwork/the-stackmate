import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/bitcoin_worker.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/model/core.dart';
import 'package:sats/pkg/interface/clipboard.dart';

part 'seed-import.freezed.dart';

enum SeedImportStep { passphrase, import }

/// Mnemonic lengths that can be recovered.
const supportedWordCounts = [12, 24];

@freezed
abstract class SeedImportState with _$SeedImportState {
  const factory SeedImportState({
    /*
     * SENSITIVE: the recovery words being entered.
     */
    @Default(<String>[]) List<String> words,
    @Default(12) int wordCount,
    @Default(SeedImportStep.import) SeedImportStep currentStep,
    /*
     * SENSITIVE: the full mnemonic, set only once its checksum is valid.
     */
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

  bool get allWordsEntered =>
      words.length == wordCount && words.every((w) => w.isNotEmpty);

  /// Every word is filled in and the BIP39 checksum is valid.
  bool get seedValid => seed.isNotEmpty;
}

class SeedImportCubit extends Cubit<SeedImportState> {
  SeedImportCubit(
    this.logger,
    this._masterKey,
    this._blockchainCubit,
    this._core,
    this._clipboard,
  ) : super(SeedImportState(words: _emptyWords(12)));

  final IStackMateBitcoin _core;
  final MasterKeyCubit _masterKey;
  final Logger logger;
  final ChainSelectCubit _blockchainCubit;
  final IClipBoard _clipboard;

  static const segwitNativePurpose = '84';
  static const invalidSeedError =
      'Invalid seed phrase. Check the words and their order.';
  static const pasteError =
      'Clipboard does not contain a 12 or 24 word phrase.';
  static const emptyString = '';

  static List<String> _emptyWords(int count) => List.filled(count, '');

  static List<String> _split(String text) => text
      .trim()
      .toLowerCase()
      .split(RegExp(r'\s+'))
      .where((w) => w.isNotEmpty)
      .toList();

  void wordCountChanged(int count) {
    if (!supportedWordCounts.contains(count) || count == state.wordCount) {
      return;
    }
    final words = [
      for (var i = 0; i < count; i++)
        i < state.words.length ? state.words[i] : '',
    ];
    _emitWords(words, wordCount: count);
  }

  /// Updates word [index]. Text containing several words (e.g. pasted into a
  /// single field) is spread over the following fields, and a complete
  /// 12/24 word phrase replaces everything.
  void wordChanged(int index, String text) {
    final parts = _split(text);
    if (parts.length > 1) {
      if (supportedWordCounts.contains(parts.length)) {
        pastePhrase(text);
        return;
      }
      final words = state.words.toList();
      for (var i = 0; i < parts.length && index + i < words.length; i++) {
        words[index + i] = parts[i];
      }
      _emitWords(words);
      return;
    }
    final words = state.words.toList();
    words[index] = parts.isEmpty ? '' : parts.first;
    _emitWords(words);
  }

  /// Fills all fields from a full 12 or 24 word phrase.
  void pastePhrase(String text) {
    final parts = _split(text);
    if (!supportedWordCounts.contains(parts.length)) {
      emit(state.copyWith(seedError: pasteError));
      return;
    }
    _emitWords(parts, wordCount: parts.length);
  }

  Future<void> pasteFromClipboard() async {
    final text = await _clipboard.pasteFromClipBoard();
    if (text.hasError) {
      emit(state.copyWith(seedError: text.error!));
      return;
    }
    pastePhrase(text.result ?? '');
  }

  void clearWords() => _emitWords(_emptyWords(state.wordCount));

  void _emitWords(List<String> words, {int? wordCount}) {
    final count = wordCount ?? state.wordCount;
    final complete = words.length == count && words.every((w) => w.isNotEmpty);
    final mnemonic = words.join(' ');
    final valid = complete && _core.isValidMnemonic(mnemonic);
    emit(
      state.copyWith(
        words: words,
        wordCount: count,
        seed: valid ? mnemonic : emptyString,
        seedError: complete && !valid ? invalidSeedError : emptyString,
        seedReady: false,
      ),
    );
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
    if (!state.seedValid) return;
    emit(
      state.copyWith(
        currentStep: SeedImportStep.passphrase,
        errPassPhrase: emptyString,
      ),
    );
  }

  /// Returns to word entry, keeping the entered words.
  void backOnSeedClicked() {
    emit(
      state.copyWith(
        currentStep: SeedImportStep.import,
        seedReady: false,
        masterXpriv: null,
        wallet: null,
      ),
    );
  }

  /// Derives the account keys from the validated phrase.
  Future<void> checkSeed() async {
    try {
      if (!state.seedValid) {
        emit(state.copyWith(seedError: invalidSeedError));
        return;
      }
      // we cannot import a primary key with passphrase - pp wallets can be derived later
      final pp = (_masterKey.state.key == null)
          ? emptyString
          : state.passPhrase;
      final root = _core
          .importMaster(
            mnemonic: state.seed,
            passphrase: pp,
            network: _blockchainCubit.state.blockchain.name,
          )
          .orThrow();

      final wallet = _core
          .deriveHardened(
            masterXPriv: root.xprv,
            account: state.accountNumber.toString(),
            purpose: segwitNativePurpose,
          )
          .orThrow();

      emit(
        state.copyWith(
          currentStep: SeedImportStep.import,
          seedReady: true,
          masterXpriv: root.xprv,
          wallet: wallet,
        ),
      );
    } catch (e, s) {
      emit(state.copyWith(seedError: e.toString()));
      logger.logException(e, 'SeedImportCubit.checkSeed', s);
    }
  }

  void clear() => emit(SeedImportState(words: _emptyWords(12)));
}
