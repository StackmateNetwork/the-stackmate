import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/api/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/clipboard.dart';

class _MockLogger extends Mock implements Logger {}

class _MockMasterKey extends Mock implements MasterKeyCubit {}

class _MockChain extends Mock implements ChainSelectCubit {}

class _MockClipboard extends Mock implements IClipBoard {}

void main() {
  const valid12 =
      'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about';
  const valid24 =
      'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon '
      'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon art';
  // Valid words, wrong checksum.
  const badChecksum12 =
      'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon';

  late _MockClipboard clipboard;
  late SeedImportCubit cubit;

  setUp(() {
    clipboard = _MockClipboard();
    final masterKey = _MockMasterKey();
    when(() => masterKey.state).thenReturn(const MasterKeyState());
    final chain = _MockChain();
    when(() => chain.state)
        .thenReturn(const BlockchainState(blockchain: Blockchain.test));
    cubit = SeedImportCubit(
      _MockLogger(),
      masterKey,
      chain,
      LibBitcoin(),
      clipboard,
    );
  });

  tearDown(() => cubit.close());

  test('starts with 12 empty words and nothing to recover', () {
    expect(cubit.state.wordCount, 12);
    expect(cubit.state.words, List.filled(12, ''));
    expect(cubit.state.seedValid, false);
  });

  test('typing all words of a valid phrase makes it recoverable', () {
    final words = valid12.split(' ');
    for (var i = 0; i < words.length; i++) {
      cubit.wordChanged(i, i.isEven ? words[i].toUpperCase() : ' ${words[i]} ');
    }
    expect(cubit.state.words, words);
    expect(cubit.state.seedValid, true);
    expect(cubit.state.seed, valid12);
    expect(cubit.state.seedError, '');
  });

  test('a complete phrase with a bad checksum is rejected', () {
    cubit.pastePhrase(badChecksum12);
    expect(cubit.state.allWordsEntered, true);
    expect(cubit.state.seedValid, false);
    expect(cubit.state.seedError, SeedImportCubit.invalidSeedError);
  });

  test('pasting a 24 word phrase switches to 24 words', () {
    cubit.pastePhrase('  ${valid24.replaceAll(' ', '\n')}  ');
    expect(cubit.state.wordCount, 24);
    expect(cubit.state.seedValid, true);
  });

  test('pasting the wrong number of words keeps the input and explains', () {
    cubit.wordChanged(0, 'abandon');
    cubit.pastePhrase('abandon ability able');
    expect(cubit.state.words.first, 'abandon');
    expect(cubit.state.seedError, SeedImportCubit.pasteError);
  });

  test('a full phrase pasted into one field fills every field', () {
    cubit.wordChanged(3, valid12);
    expect(cubit.state.words, valid12.split(' '));
    expect(cubit.state.seedValid, true);
  });

  test('switching length keeps the words already entered', () {
    cubit.wordChanged(0, 'abandon');
    cubit.wordCountChanged(24);
    expect(cubit.state.words.length, 24);
    expect(cubit.state.words.first, 'abandon');
    cubit.wordCountChanged(12);
    expect(cubit.state.words.length, 12);
  });

  test('pastes from the clipboard', () async {
    when(() => clipboard.pasteFromClipBoard())
        .thenAnswer((_) async => const R(result: valid12));
    await cubit.pasteFromClipboard();
    expect(cubit.state.seedValid, true);
  });

  test('checkSeed derives the account for a valid phrase only', () async {
    cubit.pastePhrase(badChecksum12);
    await cubit.checkSeed();
    expect(cubit.state.seedReady, false);

    cubit.pastePhrase(valid12);
    await cubit.checkSeed();
    expect(cubit.state.seedReady, true);
    expect(cubit.state.wallet!.fingerPrint, '73c5da0a');
  });

  test('going back resets seedReady but keeps the words', () async {
    cubit.pastePhrase(valid12);
    await cubit.checkSeed();
    cubit.backOnSeedClicked();
    expect(cubit.state.seedReady, false);
    expect(cubit.state.seed, valid12);
  });

  test('clear restores 12 empty fields', () {
    cubit.pastePhrase(valid24);
    cubit.clear();
    expect(cubit.state.words, List.filled(12, ''));
  });
}
