import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/pkg/extensions.dart';

class SeedGeneratePassphrase extends StatefulWidget {
  @override
  State<SeedGeneratePassphrase> createState() => _SeedGeneratePassphraseState();
}

class _SeedGeneratePassphraseState extends State<SeedGeneratePassphrase> {
  late TextEditingController _textController;
  late TextEditingController _textControllerP;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  void initState() {
    _textController = TextEditingController();
    _textControllerP = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<SeedGenerateCubit, SeedGenerateState>(
      builder: (context, state) {
        if (_textController.text != state.passPhrase)
          _textController.text = state.passPhrase;
        return Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                'optional\npassphrase'.toUpperCase(),
                style: c.fonts.headline5!.copyWith(
                  color: c.colours.onPrimary,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              // const HeaderTextDark(text: 'Enter an\noptional\npassphrase'),
              const SizedBox(height: 24),
              Text(
                'Add an (optional) security layer to your seed.\n\nIf you feel paranoid about 12 words not being enough, add some more entropy here.\n\nIf set, you cannot recover funds without it.',
                style: c.fonts.caption!.copyWith(color: c.colours.onPrimary),
              ),
              const SizedBox(height: 32),

              Padding(
                padding: EdgeInsets.zero,
                child: TextFormField(
                  enableIMEPersonalizedLearning: false,
                  autocorrect: false,
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: _textController,
                  validator: (val) {
                    return null;
                  },
                  onChanged: (text) {
                    c.read<SeedGenerateCubit>().passPhrasedChanged(text);
                  },
                  style: TextStyle(color: c.colours.onBackground),
                  decoration: const InputDecoration(
                    labelText: 'Passphrase',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.zero,
                child: TextFormField(
                  enableIMEPersonalizedLearning: false,
                  autocorrect: false,
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: _textControllerP,
                  validator: (val) {
                    if (val != _textController.text) return 'Not Matched';
                    return null;
                  },
                  style: TextStyle(color: c.colours.onBackground),
                  decoration: const InputDecoration(
                    labelText: 'Verify Passphrase',
                  ),
                ),
              ),
              const SizedBox(height: 18),
              if (state.errPassphrase != '')
                Text(
                  state.errPassphrase,
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.error,
                  ),
                ),
              const SizedBox(height: 14),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: c.colours.background,
                    backgroundColor: c.colours.primary,
                  ),
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      final FocusScopeNode currentFocus =
                          FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      c.read<SeedGenerateCubit>().finalizePassphrase();
                    }
                  },
                  child: Text('Confirm'.toUpperCase()),
                ),
              ),
            ],
          ),
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
            color: c.colours.background,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: c.fonts.subtitle2!.copyWith(
              color: onTap == null ? c.colours.primary : c.colours.onPrimary,
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
      case SeedGenerateSteps.generate:
        return SeedGenerate();
      case SeedGenerateSteps.quiz:
        return SeedConfirm();
      case SeedGenerateSteps.passphrase:
        return SeedGeneratePassphrase();
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
          Text(
            'Write down your\nseed phrase'.toUpperCase(),
            style: c.fonts.headline5!.copyWith(
              color: c.colours.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Store it somewhere reliable and safe.'.notLocalised(),
            style: c.fonts.caption!.copyWith(color: c.colours.onPrimary),
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
                foregroundColor: c.colours.background,
                backgroundColor: c.colours.primary,
              ),
              onPressed: () {
                c.read<SeedGenerateCubit>().startQuiz();
              },
              child: Text('Next'.toUpperCase()),
            ),
          ),
          const SizedBox(height: 2),
          SizedBox(
            height: 52,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: c.colours.primary,
                side: BorderSide(color: c.colours.onPrimary),
                disabledForegroundColor: c.colours.background.withOpacity(0.38),
              ),
              onPressed: () {
                c.read<SeedGenerateCubit>().backupLater();
              },
              child: Text('BackUp Later'.toUpperCase()),
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
            color: isOn ? c.colours.primary : c.colours.onPrimary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 4),
        Center(
          child: Text(
            text,
            style: c.fonts.caption!.copyWith(
              color: isSelected ? c.colours.primary : c.colours.onPrimary,
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

    final completedIdx =
        c.select((SeedGenerateCubit c) => c.state.quizSeedCompleted);

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
                style: c.fonts.headline5!.copyWith(
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
              style: c.fonts.caption!.copyWith(color: c.colours.error),
            ),
          ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'Select the correct answer',
            style: c.fonts.subtitle1!.copyWith(color: c.colours.onPrimary),
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
