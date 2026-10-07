import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/pkg/mnemonic_word.dart';

part 'words_cubit.freezed.dart';

@freezed
abstract class WordsState with _$WordsState {
  const factory WordsState({
    @Default([]) List<String> words,
    @Default('') String err,
    @Default(false) bool loading,
  }) = _WordsState;
  const WordsState._();

  static const maxSuggestions = 4;

  /// Up to [maxSuggestions] BIP39 words starting with [prefix].
  List<String> findWords(String prefix) {
    final p = prefix.trim().toLowerCase();
    if (p.isEmpty) return const [];
    return words.where((w) => w.startsWith(p)).take(maxSuggestions).toList();
  }

  /// Whether [word] is in the BIP39 word list. Until the list has loaded
  /// every word is accepted, so input is never blocked.
  bool isWord(String word) =>
      words.isEmpty || words.contains(word.trim().toLowerCase());
}

class WordsCubit extends Cubit<WordsState> {
  WordsCubit({required this.mnemonicWords}) : super(const WordsState()) {
    loadWords();
  }

  final MnemonicWords mnemonicWords;

  Future<void> loadWords() async {
    if (state.words.isNotEmpty || state.loading) return;
    emit(state.copyWith(loading: true, err: ''));
    final words = await mnemonicWords.loadWordList();
    if (words.hasError) {
      emit(state.copyWith(err: words.error!, loading: false));
      return;
    }
    emit(state.copyWith(words: words.result!, loading: false));
  }
}
