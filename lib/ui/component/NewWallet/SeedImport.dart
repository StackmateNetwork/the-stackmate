import 'package:flutter/material.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/NewWallet/SeedImport/Passphrase.dart';

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
        const SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.zero,
          child: TextField(
            enableIMEPersonalizedLearning: false,
            style: c.fonts.titleLarge!.copyWith(color: c.colours.onPrimary),
            enableSuggestions: false,
            keyboardType: TextInputType.text,
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
        IgnorePointer(
          ignoring: !state.showSeedCompleteButton(),
          child: AnimatedOpacity(
            opacity: state.showSeedCompleteButton() ? 1 : 0.3,
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: c.colours.background,
                  backgroundColor: c.colours.primary,
                ),
                onPressed: () async {
                  // if (state.showSeedCompleteButton())
                  if (!hasMaster) {
                    await c.read<SeedImportCubit>().checkSeed();
                    c.read<SeedImportWalletCubit>().nextClicked();
                  } else
                    c.read<SeedImportCubit>().gotoPassPhrase();
                },
                child: const Text('Next'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
