import 'package:flutter/material.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/pkg/extensions.dart';

class SeedImportSteps extends StatelessWidget {
  const SeedImportSteps({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final step = context.select((SeedImportCubit sc) => sc.state.currentStep);

    switch (step) {
      case SeedImportStep.passphrase:
        return const SeedImportPassphrase();
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

    return BlocBuilder<SeedImportCubit, SeedImportState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Import your seed phrase',
              style: c.fonts.headline5!.copyWith(
                color: c.colours.onPrimary,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.zero,
              child: TextField(
                enableIMEPersonalizedLearning: false,
                style: c.fonts.headline6!.copyWith(color: c.colours.onPrimary),
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
            AnimatedOpacity(
              opacity: state.showSeedCompleteButton() ? 1 : 0.3,
              duration: const Duration(milliseconds: 300),
              child: SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: c.colours.background,
                    primary: c.colours.primary,
                  ),
                  onPressed: () async {
                    if (state.showSeedCompleteButton())
                      !hasMaster
                          ? await c.read<SeedImportCubit>().checkSeed()
                          : c.read<SeedImportCubit>().gotoPassPhrase();
                    context.read<SeedImportWalletCubit>().nextClicked();
                  },
                  child: const Text('Next'),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}

class SeedImportPassphrase extends StatelessWidget {
  const SeedImportPassphrase();

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<SeedImportCubit, SeedImportState>(
      buildWhen: (previous, current) =>
          previous.errPassPhrase != current.errPassPhrase,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Text(
              'Optional\npassphrase'.toUpperCase(),
              style: c.fonts.headline5!.copyWith(
                color: c.colours.onPrimary,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.zero,
              child: TextField(
                enableIMEPersonalizedLearning: false,
                style: c.fonts.headline6!.copyWith(
                  color: c.colours.onPrimary,
                  // fontWeight: FontWeight.bold,
                ),
                enableSuggestions: false,
                keyboardType: TextInputType.text,
                autocorrect: false,
                onChanged: (text) {
                  c.read<SeedImportCubit>().passPhraseChanged(text);
                },
                decoration: const InputDecoration(labelText: 'Passphrase'),
              ),
            ),
            const SizedBox(height: 40),
            if (state.errPassPhrase != '')
              Text(
                state.errPassPhrase,
                style: c.fonts.caption!.copyWith(color: c.colours.error),
              ),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: c.colours.background,
                  primary: c.colours.primary,
                ),
                onPressed: () {
                  c.read<SeedImportCubit>().checkSeed();
                },
                child: const Text('Confirm'),
              ),
            ),
          ],
        );
      },
    );
  }
}
