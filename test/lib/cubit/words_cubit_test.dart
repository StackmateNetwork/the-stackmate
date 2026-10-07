import 'package:flutter_test/flutter_test.dart';
import 'package:sats/cubit/new-wallet/common/words_cubit.dart';
import 'package:sats/pkg/mnemonic_word.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('loads the full BIP39 English list', () async {
    final words = await MnemonicWords().loadWordList();
    expect(words.hasError, false, reason: words.error);
    expect(words.result!.length, MnemonicWords.wordCount);
    expect(words.result!.first, 'abandon');
    expect(words.result!.last, 'zoo');
  });

  test('suggests prefix matches and recognises words', () async {
    final cubit = WordsCubit(mnemonicWords: MnemonicWords());
    await cubit.stream.firstWhere((s) => s.words.isNotEmpty);
    final state = cubit.state;

    expect(state.findWords('ABA'), ['abandon']);
    expect(state.findWords('ab').length, WordsState.maxSuggestions);
    expect(state.findWords(''), isEmpty);
    expect(state.isWord('Zoo'), true);
    expect(state.isWord('bitcoin'), false);
    await cubit.close();
  });
}
