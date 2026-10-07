import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/api/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/new-wallet/common/words_cubit.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/mnemonic_word.dart';
import 'package:sats/ui/component/NewWallet/SeedImport.dart';

class _MockLogger extends Mock implements Logger {}

class _MockMasterKey extends MockCubit<MasterKeyState>
    implements MasterKeyCubit {}

class _MockChain extends Mock implements ChainSelectCubit {}

class _MockClipboard extends Mock implements IClipBoard {}

void main() {
  const valid12 =
      'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about';

  late SeedImportCubit importCubit;
  late WordsCubit wordsCubit;
  late _MockClipboard clipboard;

  Future<void> pumpPage(WidgetTester tester) async {
    final masterKey = _MockMasterKey();
    when(() => masterKey.state).thenReturn(const MasterKeyState());
    final chain = _MockChain();
    when(() => chain.state)
        .thenReturn(const BlockchainState(blockchain: Blockchain.test));
    clipboard = _MockClipboard();
    importCubit = SeedImportCubit(
      _MockLogger(),
      masterKey,
      chain,
      LibBitcoin(),
      clipboard,
    );
    // The word list loads from the asset bundle, which needs real async.
    wordsCubit = (await tester.runAsync(() async {
      final cubit = WordsCubit(mnemonicWords: MnemonicWords());
      await cubit.stream
          .firstWhere((s) => s.words.isNotEmpty)
          .timeout(const Duration(seconds: 10));
      return cubit;
    }))!;

    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.5;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<MasterKeyCubit>.value(value: masterKey),
          BlocProvider.value(value: importCubit),
          BlocProvider.value(value: wordsCubit),
        ],
        child: const MaterialApp(home: Scaffold(body: SeedImportPhrase())),
      ),
    );
  }

  ElevatedButton recoverButton(WidgetTester tester) =>
      tester.widget(find.widgetWithText(ElevatedButton, 'RECOVER WALLET'));

  testWidgets('shows 12 fields, and 24 after switching', (tester) async {
    await pumpPage(tester);
    expect(find.byType(TextField), findsNWidgets(12));
    expect(recoverButton(tester).onPressed, isNull);

    await tester.tap(find.text('24 words'));
    await tester.pump();
    expect(find.byType(TextField), findsNWidgets(24));
  });

  testWidgets('suggests words and fills the field on tap', (tester) async {
    await pumpPage(tester);
    await tester.tap(find.byType(TextField).first);
    await tester.enterText(find.byType(TextField).first, 'abo');
    await tester.pump();

    expect(find.widgetWithText(ActionChip, 'about'), findsOneWidget);
    await tester.tap(find.widgetWithText(ActionChip, 'about'));
    await tester.pump();

    expect(importCubit.state.words.first, 'about');
    final first = tester.widget<TextField>(find.byType(TextField).first);
    expect(first.controller!.text, 'about');
  });

  testWidgets('paste fills every field and enables recovery', (tester) async {
    await pumpPage(tester);
    when(() => clipboard.pasteFromClipBoard())
        .thenAnswer((_) async => const R(result: valid12));

    await tester.tap(find.text('PASTE'));
    await tester.pump();

    final fields = tester.widgetList<TextField>(find.byType(TextField));
    expect(fields.map((f) => f.controller!.text).join(' '), valid12);
    expect(recoverButton(tester).onPressed, isNotNull);
  });

  testWidgets('recovery words are hidden from keyboard learning',
      (tester) async {
    await pumpPage(tester);
    final field = tester.widget<TextField>(find.byType(TextField).first);
    expect(field.autocorrect, false);
    expect(field.enableSuggestions, false);
    expect(field.enableIMEPersonalizedLearning, false);
  });
}
