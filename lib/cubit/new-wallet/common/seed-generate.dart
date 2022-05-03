import 'dart:math';

import 'package:bitcoin/bitcoin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/pkg/extensions.dart';

part 'seed-generate.freezed.dart';

enum SeedGenerateSteps {
  passphrase,
  generate,
  quiz,
}

@freezed
class SeedGenerateState with _$SeedGenerateState {
  const factory SeedGenerateState({
    @Default(SeedGenerateSteps.passphrase) currentStep,
    List<String>? seed,
    String? masterXpriv,
    String? xpriv,
    String? fingerPrint,
    DerivedKeys? wallet,
    @Default(false) bool generatingSeed,
    @Default(12) int seedLength,
    @Default('') String seedError,
    @Default(0) int quizSeedCompleted,
    @Default('') String quizSeedAnswer,
    @Default(-1) int quizSeedAnswerIdx,
    @Default([]) List<String> quizSeedList,
    @Default([]) List<String> quizSeedCompletedAnswers,
    @Default('') String quizSeedError,
    @Default('') String passPhrase,
    @Default('') String errPassphrase,
  }) = _SeedGenerateState;
  const SeedGenerateState._();
}

class SeedGenerateCubit extends Cubit<SeedGenerateState> {
  SeedGenerateCubit(
    this._bitcoin,
    this._blockchainCubit,
    this._logger,
  ) : super(const SeedGenerateState());

  final IStackMateCore _bitcoin;
  final ChainSelectCubit _blockchainCubit;
  final Logger _logger;

  static const accountZero = '0';
  static const segwitNativePurpose = '84';
  static const incorerctWordError = 'Incorrect Word Selected.';
  static const invalidPassphraseError = 'Invalid Passphrase';
  static const unableToDeriveError =
      'Unable to derive child keys from this seed.';
  static const emptyString = '';

  void passPhrasedChanged(String text) =>
      emit(state.copyWith(passPhrase: text));

  void confirmPassphrase() {
    if (state.passPhrase.length > 8 || state.passPhrase.contains(' ')) {
      emit(state.copyWith(errPassphrase: invalidPassphraseError));
      return;
    }

    generateSeed();

    emit(
      state.copyWith(
        currentStep: SeedGenerateSteps.generate,
        errPassphrase: '',
      ),
    );
  }

  void seedLengthChanged(String len) =>
      emit(state.copyWith(seedLength: int.parse(len)));

  void generateSeed() async {
    emit(
      state.copyWith(
        generatingSeed: true,
        seedError: emptyString,
      ),
    );

    final root = _bitcoin.generateMaster(
      length: state.seedLength.toString(),
      passphrase: state.passPhrase,
      network: _blockchainCubit.state.blockchain.name,
    );
    if (root.hasError) {
      final smError = SMError.fromJson(root.error!);
      emit(
        state.copyWith(
          generatingSeed: false,
          seedError: smError.message,
          currentStep: SeedGenerateSteps.generate,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        generatingSeed: false,
        currentStep: SeedGenerateSteps.generate,
        seed: root.result!.neuList,
        masterXpriv: root.result!.xprv,
        fingerPrint: root.result!.fingerprint,
      ),
    );
  }

  void startQuiz() {
    emit(
      state.copyWith(
        currentStep: SeedGenerateSteps.quiz,
        quizSeedCompleted: 0,
      ),
    );

    _updateQuiz();
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
          currentStep: SeedGenerateSteps.passphrase,
        ),
      );
      return;
    }
    emit(state.copyWith(quizSeedError: emptyString));

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

  void _quizCompleted() {
    final wallet = _bitcoin.deriveHardened(
      masterXPriv: state.masterXpriv!,
      account: accountZero,
      purpose: segwitNativePurpose,
    );

    if (wallet.hasError) {
      final smError = SMError.fromJson(wallet.error!);
      emit(state.copyWith(seedError: unableToDeriveError));
    } else
      emit(state.copyWith(wallet: wallet.result!));
  }

  void clear() => emit(const SeedGenerateState());
}
