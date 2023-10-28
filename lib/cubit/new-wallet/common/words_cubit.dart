import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/pkg/mnemonic_word.dart';

part 'words_cubit.freezed.dart';

@freezed
class WordsState with _$WordsState {
  const factory WordsState({
    /**
     * 
     * SENSITIVE
     * 
     */
    List<String>? words,
    /**
     * 
     * SENSITIVE
     * 
     */
    @Default('') String err,
    @Default(false) bool loading,
  }) = _WordsState;
  const WordsState._();

  List<String> findWords(String str) {
    if (str.isEmpty) return [];
    final w = words!
        .where((word) => word.toLowerCase().startsWith(str.toLowerCase()))
        .toList();
    return w.length > 3 ? w.sublist(0, 3) : w;
  }
}

class WordsCubit extends Cubit<WordsState> {
  WordsCubit({
    required this.mnemonicWords,
  }) : super(const WordsState()) {
    loadWords();
  }

  final MnemonicWords mnemonicWords;

  Future<void> loadWords() async {
    emit(state.copyWith(loading: true));
    final words = await mnemonicWords.loadWordList();
    if (words.error != null) {
      emit(state.copyWith(err: words.error.toString(), loading: false));
      return;
    }
    emit(state.copyWith(words: words.result, loading: false));
  }
}
