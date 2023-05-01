import 'package:flutter/material.dart';
import 'package:sats/cubit/seed-backup.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/BackupWallet/Warning.dart';

class SeedWordCell extends StatelessWidget {
  const SeedWordCell({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final Function? onTap;

  @override
  Widget build(BuildContext c) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (onTap == null) return;
          onTap!();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: c.colours.background,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: c.fonts.titleSmall!.copyWith(
              color: onTap == null ? c.colours.primary : c.colours.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class SeedBackupStepSelect extends StatelessWidget {
  const SeedBackupStepSelect({super.key});

  @override
  Widget build(BuildContext c) {
    final step = c.select((SeedBackupCubit c) => c.state.currentStep);

    switch (step) {
      case SeedBackupSteps.warning:
        return SeedBackupWarning();
      case SeedBackupSteps.display:
        return SeedBackup();
      case SeedBackupSteps.quiz:
        return SeedConfirm();
    }
  }
}

class SeedBackup extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final words = c.select((SeedBackupCubit c) => c.state.seed);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Text(
            'Write down your\nseed phrase'.toUpperCase(),
            style: c.fonts.headlineSmall!.copyWith(
              color: c.colours.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Store it somewhere reliable and safe.'.notLocalised(),
            style: c.fonts.bodySmall!.copyWith(color: c.colours.onPrimary),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (words != null)
                  for (var i = 0; i < words.length; i++)
                    if (i.isEven && i < 24)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            if (i == 0)
                              SeedWordCell(text: '1. ' + words[i])
                            else
                              SeedWordCell(
                                text: (i + 1).toString() + '. ' + words[i],
                              ),
                            const SizedBox(width: 8),
                            SeedWordCell(
                              text: (i + 2).toString() + '. ' + words[i + 1],
                            )
                          ],
                        ),
                      )
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: c.colours.background, backgroundColor: c.colours.primary,
              ),
              onPressed: () {
                c.read<SeedBackupCubit>().startQuiz();
              },
              child: Text('Next'.toUpperCase()),
            ),
          ),
          const SizedBox(height: 12)
        ],
      ),
    );
  }
}

class ConfirmStepCell extends StatelessWidget {
  const ConfirmStepCell({
    super.key,
    required this.isOn,
    required this.isSelected,
    required this.text,
  });

  final bool isOn;
  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext c) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: c.width * 0.2,
          decoration: BoxDecoration(
            color: isOn ? c.colours.primary : c.colours.onPrimary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 4),
        Center(
          child: Text(
            text,
            style: c.fonts.bodySmall!.copyWith(
              color: isSelected ? c.colours.primary : c.colours.secondary,
            ),
          ),
        )
      ],
    );
  }
}

class SeedConfirm extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final answerIdx = c.select(
      (SeedBackupCubit c) => c.state.quizSeedAnswerIdx.toString(),
    );

    final completedIdx =
        c.select((SeedBackupCubit c) => c.state.quizSeedCompleted);

    final words = c.select((SeedBackupCubit c) => c.state.quizSeedList);

    final error = c.select((SeedBackupCubit c) => c.state.quizSeedError);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Confirm seed\nphrase',
            style: c.fonts.headlineMedium!.copyWith(
              color: c.colours.onPrimary,
              // fontWeight: FontWeight.bold,
            ),
          ),

          //  HeaderTextDark(text: 'Confirm seed\nphrase'),
        ),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 2),
          ),
          child: SizedBox(
            height: 88,
            child: Center(
              child: Text(
                answerIdx + '.',
                style: c.fonts.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: c.colours.onPrimary,
                ),
              ),
            ),
          ),
        ),
        if (error != '')
          Center(
            child: Text(
              error,
              style: c.fonts.bodySmall!.copyWith(color: c.colours.error),
            ),
          ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'Select the correct answer',
            style: c.fonts.titleMedium!.copyWith(color: c.colours.onPrimary),
          ),
        ),
        const SizedBox(height: 16),
        for (var i = 0; i < words.length; i++)
          if (i.isEven)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SeedWordCell(
                  text: words[i],
                  onTap: () {
                    c.read<SeedBackupCubit>().seedWordSelected(words[i]);
                  },
                ),
                const SizedBox(width: 8),
                SeedWordCell(
                  text: words[i + 1],
                  onTap: () {
                    c.read<SeedBackupCubit>().seedWordSelected(words[i + 1]);
                  },
                )
              ],
            ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ConfirmStepCell(isOn: true, isSelected: true, text: ''),
            ConfirmStepCell(isOn: completedIdx > 1, isSelected: true, text: ''),
            ConfirmStepCell(isOn: completedIdx > 2, isSelected: true, text: '')
          ],
        )
      ],
    );
  }
}
