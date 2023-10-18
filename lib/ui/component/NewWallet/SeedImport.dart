import 'package:flutter/material.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/pkg/extensions.dart';
//import 'package:sats/pkg/mnenomic_word.dart';
import 'package:sats/ui/component/NewWallet/SeedImport/Passphrase.dart';
import 'package:sats/ui/component/common/CustomKeyboard.dart';

class SeedImportSteps extends StatelessWidget {
  const SeedImportSteps({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final step = context.select((SeedImportCubit sc) => sc.state.currentStep);

    switch (step) {
      case SeedImportStep.passphrase:
        return SeedImportPassphrase();
      case SeedImportStep.import:
        return const SeedImportPhrase();
    }
  }
}

class SeedImportPhrase extends StatelessWidget {
  const SeedImportPhrase();

  @override
  Widget build(BuildContext c) {
    final hasMaster = c.select((MasterKeyCubit mk) => mk.state.key != null);
    final state = c.select((SeedImportCubit _) => _.state);
    final textController = TextEditingController();
    final words = c.select((SeedImportCubit _) => _.state.words);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Import your seed phrase',
          style: c.fonts.headlineSmall!.copyWith(
            color: c.colours.onPrimary,
            // fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: TextField(
            controller: textController,
            enableIMEPersonalizedLearning: false,
            style: c.fonts.titleLarge!.copyWith(color: c.colours.onPrimary),
            enableSuggestions: false,
            keyboardType: TextInputType.none,
            autocorrect: false,
            onChanged: (text) {
              c.read<SeedImportCubit>().seedTextChanged(text);
            },
            maxLines: 8,
            decoration: InputDecoration(
              hintText: '12/24 word seed phrase',
              fillColor: c.colours.surface,
              errorText: state.seedError.nullIfEmpty(),
            ),
          ),
        ),
        const SizedBox(height: 24),
        // if (!state.showSeedCompleteButton())
        //   SizedBox(
        //     height: 52,
        //     child: ElevatedButton(
        //       style: ElevatedButton.styleFrom(
        //         foregroundColor: c.colours.background,
        //         backgroundColor: c.colours.primary,
        //       ),
        //       onPressed: () {
        //         c.read<SeedImportCubit>().seedValidate(textController.text);
        //       },
        //       child: const Text('Validate seed'),
        //     ),
        //   ),
        const SizedBox(height: 24),
        SizedBox(
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: c.colours.background,
              backgroundColor: c.colours.primary,
            ),
            onPressed: () async {
              final FocusScopeNode currentFocus = FocusScope.of(c);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              if (!hasMaster) {
                await c.read<SeedImportCubit>().checkSeed();
                c.read<SeedImportWalletCubit>().nextClicked();
              } else {
                c.read<SeedImportCubit>().gotoPassPhrase();
              }
            },
            child: const Text('Next'),
          ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              BuiltInKeyboard(
                textStyle: TextStyle(fontSize: 14, color: c.colours.error),
                backgroundColor: c.colours.primary,
                suggestions: state.findWords(textController.text),
                onTap: () {
                  c.read<SeedImportCubit>().seedTextChanged(state.words!.first);
                },
                color: c.colours.primary,
                width: 26,
                height: 45,
                letterStyle:
                    TextStyle(fontSize: 20, color: c.colours.background),
                borderRadius: BorderRadius.circular(1),
                controller: textController,
                enableSpaceBar: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
