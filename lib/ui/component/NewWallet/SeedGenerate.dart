import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/pkg/extensions.dart';

class SeedGeneratePassphrase extends StatefulWidget {
  @override
  State<SeedGeneratePassphrase> createState() => _SeedGeneratePassphraseState();
}

class _SeedGeneratePassphraseState extends State<SeedGeneratePassphrase> {
  late TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<SeedGenerateCubit, SeedGenerateState>(
      builder: (context, state) {
        if (_textController.text != state.passPhrase) _textController.text = state.passPhrase;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Text(
              'optional\npassphrase'.toUpperCase(),
              style: c.fonts.headline5!.copyWith(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
              ),
            ),
            // const HeaderTextDark(text: 'Enter an\noptional\npassphrase'),
            const SizedBox(height: 24),
            Text(
              'Add an extra security layer to your seed.\nDo not write down your passphrase.\nThis passphrase should be added as the last word of your seed.',
              style: c.fonts.caption!.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 32),

            Padding(
              padding: EdgeInsets.zero,
              child: TextField(
                controller: _textController,
                onChanged: (text) {
                  c.read<SeedGenerateCubit>().passPhrasedChanged(text);
                },
                style: TextStyle(color: c.colours.onBackground),
                decoration: const InputDecoration(
                  labelText: 'Passphrase',
                ),
              ),
            ),
            const SizedBox(height: 40),
            if (state.errPassphrase != '')
              Text(
                state.errPassphrase,
                style: c.fonts.caption!.copyWith(
                  color: c.colours.error,
                ),
              ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  c.read<SeedGenerateCubit>().confirmPassphrase();
                },
                child: Text('Confirm'.toUpperCase()),
              ),
            )
          ],
        );
      },
    );
  }
}

class SeedWordCell extends StatelessWidget {
  const SeedWordCell({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

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
            color: c.colours.secondary,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: c.fonts.subtitle2!.copyWith(
              color: onTap == null ? Colors.white : c.colours.primary,
            ),
          ),
        ),
      ),
    );
  }
}

class SeedGenerateStepSelect extends StatelessWidget {
  const SeedGenerateStepSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final step = c.select((SeedGenerateCubit c) => c.state.currentStep);

    switch (step) {
      case SeedGenerateSteps.passphrase:
        return SeedGeneratePassphrase();
      case SeedGenerateSteps.generate:
        return SeedGenerate();
      case SeedGenerateSteps.quiz:
        return SeedConfirm();
    }

    return Container();
  }
}

class SeedGenerate extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final words = c.select((SeedGenerateCubit c) => c.state.seed);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),

          // HeaderTextDark(text: 'Write down your\nseed phrase'.notLocalised()),
          Text(
            'Write down your\nseed phrase'.toUpperCase(),
            style: c.fonts.headline5!.copyWith(
              color: Colors.white,
              // fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Make sure that no one can view,\nwhat you are writing'.notLocalised(),
            style: c.fonts.caption!.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (words != null)
                  for (var i = 0; i < words.length; i++)
                    if (i.isEven && i < 12)
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
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextButton(
              onPressed: () {
                c.read<SeedGenerateCubit>().startQuiz();
              },
              child: Text('Next'.toUpperCase()),
            ),
          ),
          const SizedBox(height: 24)
        ],
      ),
    );
  }
}

class ConfirmStepCell extends StatelessWidget {
  const ConfirmStepCell({
    Key? key,
    required this.isOn,
    required this.isSelected,
    required this.text,
  }) : super(key: key);

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
            color: isOn ? c.colours.secondary : Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 4),
        Center(
          child: Text(
            text,
            style: c.fonts.caption!.copyWith(
              color: isSelected ? c.colours.secondary : c.colours.secondary,
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
      (SeedGenerateCubit c) => c.state.quizSeedAnswerIdx.toString(),
    );

    final completedIdx = c.select((SeedGenerateCubit c) => c.state.quizSeedCompleted);

    final words = c.select((SeedGenerateCubit c) => c.state.quizSeedList);

    final error = c.select((SeedGenerateCubit c) => c.state.quizSeedError);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Confirm seed\nphrase',
            style: c.fonts.headline4!.copyWith(
              color: Colors.white,
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
                style: c.fonts.headline5!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        if (error != '')
          Center(
            child: Text(
              error,
              style: c.fonts.caption!.copyWith(color: c.colours.error),
            ),
          ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'Select the correct answer',
            style: c.fonts.subtitle1!.copyWith(color: Colors.white),
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
                    c.read<SeedGenerateCubit>().seedWordSelected(words[i]);
                  },
                ),
                const SizedBox(width: 8),
                SeedWordCell(
                  text: words[i + 1],
                  onTap: () {
                    c.read<SeedGenerateCubit>().seedWordSelected(words[i + 1]);
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
