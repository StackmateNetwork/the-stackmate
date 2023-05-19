import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/launcher.dart';

part 'seed-backup.freezed.dart';

enum SeedBackupSteps {
  warning,
  display,
  quiz,
}

@freezed
class SeedBackupState with _$SeedBackupState {
  const factory SeedBackupState({
    @Default(SeedBackupSteps.warning) SeedBackupSteps currentStep,
    List<String>? seed,
    String? rootXprv,
    String? fingerPrint,
    @Default(0) int quizSeedCompleted,
    @Default('') String quizSeedAnswer,
    @Default(-1) int quizSeedAnswerIdx,
    @Default([]) List<String> quizSeedList,
    @Default([]) List<String> quizSeedCompletedAnswers,
    @Default('') String quizSeedError,
    @Default('') String errMasterKeyUpdate,
    @Default(false) bool backupLater,
    @Default(false) bool backupComplete,
  }) = _SeedBackupState;
  const SeedBackupState._();
  bool canGoBack() {
    if (currentStep == SeedBackupSteps.display) return true;
    return true;
  }
}

class SeedBackupCubit extends Cubit<SeedBackupState> {
  SeedBackupCubit(
    this._masterKey,
    this._launcher,
  ) : super(const SeedBackupState());

  final MasterKeyCubit _masterKey;
  final ILauncher _launcher;

  static const accountZero = '0';
  static const segwitNativePurpose = '84';
  static const incorerctWordError = 'Incorrect Word Selected.';
  static const emptyString = '';
  void init() async {
    await _masterKey.init();

    emit(
      state.copyWith(
        backupComplete: false,
        seed: _masterKey.state.key!.seed?.split(' '),
        rootXprv: _masterKey.state.key!.root,
        fingerPrint: _masterKey.state.key!.fingerprint,
      ),
    );
  }

  void backClicked() {
    switch (state.currentStep) {
      case SeedBackupSteps.warning:
        break;
      case SeedBackupSteps.display:
        emit(
          state.copyWith(
            currentStep: SeedBackupSteps.warning,
          ),
        );
        break;
      case SeedBackupSteps.quiz:
        emit(
          state.copyWith(
            currentStep: SeedBackupSteps.display,
          ),
        );
        break;
    }
  }

  Future<void> nextClicked() async {
    switch (state.currentStep) {
      case SeedBackupSteps.warning:
        emit(state.copyWith(currentStep: SeedBackupSteps.display));
        break;

      case SeedBackupSteps.display:
        emit(state.copyWith(currentStep: SeedBackupSteps.quiz));
        break;

      case SeedBackupSteps.quiz:
        if (!state.backupComplete) await _completeBackup();
        break;
    }
  }

  Future<void> _completeBackup() async {
    try {
      await _masterKey.save(
        state.rootXprv!,
        state.fingerPrint!,
        state.seed!.join(' '),
      );
      await _masterKey.init();
      emit(
        state.copyWith(
          backupComplete: true,
        ),
      );
      clear();
    } catch (e) {
      emit(
        state.copyWith(
          errMasterKeyUpdate: e.toString(),
          currentStep: SeedBackupSteps.warning,
        ),
      );
    }
  }

  void startQuiz() {
    if (state.seed!.isNotEmpty) {
      emit(
        state.copyWith(
          currentStep: SeedBackupSteps.quiz,
          quizSeedCompleted: 0,
        ),
      );

      _updateQuiz();
    } else {
      return;
    }
  }

  void _updateQuiz() {
    final List<String> quizList = [...state.seed!];

    String answer = emptyString;
    while (answer == emptyString) {
      final idx = Random().nextInt(quizList.length);
      if (!state.quizSeedCompletedAnswers.contains(quizList[idx]))
        answer = quizList[idx];
    }
    final answerIdx = quizList.indexOf(answer);

    for (final completed in state.quizSeedCompletedAnswers)
      quizList.remove(completed);

    final List<String> answerList = [answer];
    quizList.remove(answer);
    for (var i = 0; i < 5; i++) {
      final randIdx = Random().nextInt(quizList.length);
      answerList.add(quizList[randIdx]);
      quizList.remove(quizList[randIdx]);
      if (quizList.isNotEmpty) quizList.removeLast();
    }

    answerList.shuffle();

    emit(
      state.copyWith(
        quizSeedError: emptyString,
        quizSeedAnswer: answer,
        quizSeedList: answerList,
        quizSeedAnswerIdx: answerIdx + 1,
      ),
    );
  }

  void seedWordSelected(String text) async {
    if (text != state.quizSeedAnswer) {
      emit(state.copyWith(quizSeedError: incorerctWordError));
      await Future.delayed(const Duration(seconds: 1));
      emit(
        state.copyWith(
          currentStep: SeedBackupSteps.warning,
        ),
      );
      return;
    }

    final List<String> completedAnswers =
        state.quizSeedCompletedAnswers.toList();
    completedAnswers.add(text);

    emit(
      state.copyWith(
        quizSeedCompletedAnswers: completedAnswers,
        quizSeedCompleted: completedAnswers.length,
      ),
    );

    if (completedAnswers.length == 3) {
      _quizCompleted();
    } else {
      _updateQuiz();
    }
    return;
  }

  Future<void> _quizCompleted() async {
    emit(
      state.copyWith(
        quizSeedCompletedAnswers: [],
        quizSeedAnswer: '',
      ),
    );
    await nextClicked();
  }

  void openLink(String url) {
    try {
      _launcher.launchApp(url);
    } catch (e, _) {
      emit(
        state.copyWith(
          errMasterKeyUpdate: 'Could not open url',
        ),
      );
    }
  }

  void clear() => emit(const SeedBackupState());
}
