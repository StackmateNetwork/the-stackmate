import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/seed-backup.dart';
import 'package:sats/model/master.dart';
import 'package:sats/pkg/interface/launcher.dart';

class _MasterKey extends Mock implements MasterKeyCubit {}

class _Launcher extends Mock implements ILauncher {}

const _words =
    'abandon ability able about above absent absorb abstract absurd abuse '
    'access accident';

void main() {
  test('a wrong answer restarts the quiz from zero', () async {
    final master = _MasterKey();
    when(master.init).thenAnswer((_) async {});
    when(() => master.state).thenReturn(
      const MasterKeyState(
        key: MasterKey(seed: _words, root: 'xprv', fingerprint: 'f00d'),
      ),
    );
    final cubit = SeedBackupCubit(master, _Launcher());
    await cubit.init();

    cubit.startQuiz();
    await cubit.seedWordSelected(cubit.state.quizSeedAnswer);
    await cubit.seedWordSelected(cubit.state.quizSeedAnswer);
    expect(cubit.state.quizSeedCompleted, 2);

    final wrong = cubit.state.quizSeedList.firstWhere(
      (w) => w != cubit.state.quizSeedAnswer,
    );
    await cubit.seedWordSelected(wrong);
    expect(cubit.state.currentStep, SeedBackupSteps.warning);

    cubit.startQuiz();
    expect(cubit.state.quizSeedCompleted, 0);
    expect(cubit.state.quizSeedCompletedAnswers, isEmpty);
    await cubit.seedWordSelected(cubit.state.quizSeedAnswer);
    expect(cubit.state.backupComplete, isFalse);
  });
}
