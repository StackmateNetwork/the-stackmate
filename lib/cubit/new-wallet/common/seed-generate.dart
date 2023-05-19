import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libstackmate/libstackmate.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/launcher.dart';

part 'seed-generate.freezed.dart';

enum SeedGenerateSteps {
  generate,
  quiz,
}

@freezed
class SeedGenerateState with _$SeedGenerateState {
  const factory SeedGenerateState({
    @Default(SeedGenerateSteps.generate) currentStep,
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
    @Default(false) bool backupLater,
  }) = _SeedGenerateState;
  const SeedGenerateState._();
}

class SeedGenerateCubit extends Cubit<SeedGenerateState> {
  SeedGenerateCubit(
    this._bitcoin,
    this._masterKey,
    this._blockchainCubit,
    this._logger,
    this._launcher,
  ) : super(const SeedGenerateState());

  final IStackMateBitcoin _bitcoin;
  final MasterKeyCubit _masterKey;
  final ChainSelectCubit _blockchainCubit;
  final Logger _logger;
  final ILauncher _launcher;

  static const accountZero = '0';
  static const segwitNativePurpose = '84';
  static const incorerctWordError = 'Incorrect Word Selected.';
  static const unableToDeriveError =
      'Unable to derive child keys from this seed.';
  static const emptyString = '';

  Future<void> finalize() async {
    final root = _bitcoin.importMaster(
      mnemonic: state.seed!.join(' '),
      passphrase: emptyString,
      network: _blockchainCubit.state.blockchain.name,
    );
    if (root.hasError) {
      final smError = SMError.fromJson(root.error!);
      emit(
        state.copyWith(
          generatingSeed: false,
          seedError: smError.message,
        ),
      );
    }
    if (state.backupLater) {
      await _masterKey.saveBackupPending(
        root.result!.mnemonic,
        root.result!.xprv,
        root.result!.fingerprint,
      );
    } else {
      await _masterKey.save(
        root.result!.xprv,
        root.result!.fingerprint,
        root.result!.mnemonic,
      );
    }
    await _masterKey.init();

    clear();

    final wallet = _bitcoin.deriveHardened(
      masterXPriv: root.result!.xprv,
      account: accountZero,
      purpose: segwitNativePurpose,
    );

    if (wallet.hasError) {
      final smError = SMError.fromJson(wallet.error!);
      emit(state.copyWith(seedError: unableToDeriveError));
      _logger.logException(
        smError.oneliner,
        'SeedImportWalletCubit._createNewLocalWallet',
        emptyString,
      );
    } else
      emit(
        state.copyWith(
          wallet: wallet.result,
          quizSeedCompletedAnswers: [],
          quizSeedAnswer: '',
        ),
      );
  }

  void seedLengthChanged(int len) => emit(
        state.copyWith(
          seedLength: len,
        ),
      );

  void generateSeed() async {
    emit(
      state.copyWith(
        generatingSeed: true,
        seedError: emptyString,
        currentStep: SeedGenerateSteps.generate,
      ),
    );
    final root = _bitcoin.generateMaster(
      length: state.seedLength.toString(),
      passphrase: emptyString,
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
    return;
  }

  void startQuiz() {
    if (state.seed!.isNotEmpty) {
      emit(
        state.copyWith(
          currentStep: SeedGenerateSteps.quiz,
          quizSeedCompleted: 0,
        ),
      );
      _updateQuiz();
    } else {
      return;
    }
  }

  void backupLater() {
    if (state.seed!.isNotEmpty) {
      emit(
        state.copyWith(
          backupLater: true,
        ),
      );
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
    return;
  }

  void seedWordSelected(String text) async {
    if (text != state.quizSeedAnswer) {
      emit(state.copyWith(quizSeedError: incorerctWordError));
      await Future.delayed(const Duration(seconds: 1));
      emit(
        state.copyWith(
          currentStep: SeedGenerateSteps.generate,
        ),
      );
      return;
    }
    // emit(state.copyWith(quizSeedError: emptyString));

    final List<String> completedAnswers =
        state.quizSeedCompletedAnswers.toList();
    completedAnswers.add(text);

    emit(
      state.copyWith(
        quizSeedCompletedAnswers: completedAnswers,
        quizSeedCompleted: completedAnswers.length,
      ),
    );

    if (state.quizSeedCompleted == 3) {
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
      _logger.logException(
        smError.oneliner,
        'SeedImportWalletCubit._createNewLocalWallet',
        emptyString,
      );
    } else
      emit(
        state.copyWith(
          wallet: wallet.result,
          seed: state.seed,
          quizSeedCompletedAnswers: [],
          quizSeedAnswer: '',
        ),
      );
  }

  void openLink(String url) {
    try {
      _launcher.launchApp(url);
    } catch (e, s) {
      _logger.logException(e, 'LearnSeedBitcoin.openLink', s);
    }
  }

  void clear() => emit(const SeedGenerateState());
}
