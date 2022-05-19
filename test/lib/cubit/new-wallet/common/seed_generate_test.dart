import 'package:bitcoin/types.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/api/interface/logger.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:test/test.dart';

class _MockStorage extends Mock implements IStorage {}

class _MockLogApi extends Mock implements ILogAPI {}

class _MockClipboard extends Mock implements IClipBoard {}

class _MockLibStackmate extends Mock implements IStackMateCore {}

void main() {
  group('seedGenerate: CORE OPS', () {
    final IStorage _storage = _MockStorage();
    final clipboard = _MockClipboard();
    final logAPI = _MockLogApi();
    final logger = Logger(clipboard, logAPI);
    final chainSelectCubit = ChainSelectCubit(_storage, logger);
    final IStackMateCore _bitcoin = _MockLibStackmate();

    late SeedGenerateCubit seedGenerateCubit;

    const expectedSeed = Seed(
      'transfer spare party divorce screen used pole march warfare another balance find',
      '8099ce1e',
      'tprv8ZgxMBicQKsPctM9UgftwPdDCxMq2c57utsBu5htMG7ySHZzT33jWyiSBQJwvjDEoMHmZGFgezhVTyKmiKfdPtdFtoAAdSzFYdstokvpop1',
    );

    setUp(() async {
      seedGenerateCubit = SeedGenerateCubit(_bitcoin, chainSelectCubit, logger);
    });

    tearDown(() {});
    blocTest<SeedGenerateCubit, SeedGenerateState>(
      'Clear Seed Generate State',
      build: () {
        return seedGenerateCubit;
      },
      act: (cubit) async {
        cubit.clear();
      },
      expect: () => <SeedGenerateState>[
        const SeedGenerateState(),
      ],
      verify: (cubit) => [],
    );
    blocTest<SeedGenerateCubit, SeedGenerateState>(
      'Generate new wallet flow.',
      build: () {
        when(
          () => _bitcoin.generateMaster(
            length: '12',
            passphrase: '',
            network: 'test',
          ),
        ).thenReturn(
          const R(result: expectedSeed),
        );
        return seedGenerateCubit;
      },
      act: (cubit) async {
        cubit.passPhrasedChanged('test');
        cubit.passPhrasedChanged('');
        cubit.generateSeed();
      },
      expect: () => <SeedGenerateState>[
        const SeedGenerateState(
          passPhrase: 'test',
          generatingSeed: false,
          currentStep: SeedGenerateSteps.passphrase,
        ),
        const SeedGenerateState(
          passPhrase: '',
          generatingSeed: false,
          currentStep: SeedGenerateSteps.passphrase,
        ),
        const SeedGenerateState(
          generatingSeed: true,
          currentStep: SeedGenerateSteps.generate,
        ),
        SeedGenerateState(
          generatingSeed: false,
          currentStep: SeedGenerateSteps.generate,
          masterXpriv: expectedSeed.xprv,
          seed: expectedSeed.neuList,
          fingerPrint: expectedSeed.fingerprint,
        ),
      ],
      verify: (cubit) => [],
    );

    late List<String> answers;

    late String answer1;
    late int answer1Index;

    // late String answer2;
    // late int answer2Index;

    // late String answer3;
    // late int answer3Index;

    blocTest<SeedGenerateCubit, SeedGenerateState>(
      'Quiz new wallet flow.',
      build: () {
        when(
          () => _bitcoin.generateMaster(
            length: '12',
            passphrase: '',
            network: 'test',
          ),
        ).thenReturn(
          const R(result: expectedSeed),
        );
        return seedGenerateCubit;
      },
      act: (cubit) async {
        cubit.generateSeed();
        cubit.startQuiz();
        answers = cubit.state.quizSeedList;
        answer1 = cubit.state.quizSeedAnswer;
        answer1Index = cubit.state.quizSeedAnswerIdx;
        // cubit.seedWordSelected(answer1);
        // await Future.delayed(Duration(seconds: 1));
        // answer2 = cubit.state.quizSeedAnswer;
        // answer2Index = cubit.state.quizSeedAnswerIdx;
      },
      expect: () => <SeedGenerateState>[
        const SeedGenerateState(
          generatingSeed: true,
          currentStep: SeedGenerateSteps.generate,
        ),
        SeedGenerateState(
          generatingSeed: false,
          currentStep: SeedGenerateSteps.generate,
          masterXpriv: expectedSeed.xprv,
          seed: expectedSeed.mnemonic.split(' '),
          fingerPrint: expectedSeed.fingerprint,
        ),
        SeedGenerateState(
          generatingSeed: false,
          currentStep: SeedGenerateSteps.quiz,
          masterXpriv: expectedSeed.xprv,
          seed: expectedSeed.mnemonic.split(' '),
          fingerPrint: expectedSeed.fingerprint,
          quizSeedCompleted: 0,
        ),
        SeedGenerateState(
          generatingSeed: false,
          currentStep: SeedGenerateSteps.quiz,
          masterXpriv: expectedSeed.xprv,
          seed: expectedSeed.mnemonic.split(' '),
          fingerPrint: expectedSeed.fingerprint,
          quizSeedError: '',
          quizSeedAnswer: answer1,
          quizSeedAnswerIdx: answer1Index,
          quizSeedList: answers,
          quizSeedCompleted: 0,
        ),
        // SeedGenerateState(
        //   generatingSeed: false,
        //   currentStep: SeedGenerateSteps.quiz,
        //   masterXpriv: expectedSeed.xprv,
        //   seed: expectedSeed.mnemonic.split(' '),
        //   fingerPrint: expectedSeed.fingerprint,
        //   quizSeedError: '',
        //   quizSeedAnswer: answer2,
        //   quizSeedList: answers,
        //   quizSeedAnswerIdx: answer2Index,
        //   quizSeedCompletedAnswers: [answer1],
        //   quizSeedCompleted: 1,
        // ),
        // SeedGenerateState(
        //   generatingSeed: false,
        //   currentStep: SeedGenerateSteps.quiz,
        //   masterXpriv: expectedSeed.xprv,
        //   seed: expectedSeed.mnemonic.split(' '),
        //   fingerPrint: expectedSeed.fingerprint,
        //   quizSeedError: '',
        //   quizSeedAnswer: answer2,
        //   quizSeedList: answers,
        //   quizSeedAnswerIdx: answer2Index,
        //   quizSeedCompletedAnswers: [answer1],
        //   quizSeedCompleted: 1,
        // ),
      ],
    );
  });
}
