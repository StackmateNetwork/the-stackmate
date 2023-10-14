import 'package:flutter/material.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/pkg/extensions.dart';
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

class SeedImportPhrase extends StatefulWidget {
  const SeedImportPhrase();

  @override
  _SeedImportFieldsState createState() => _SeedImportFieldsState();
}

class _SeedImportFieldsState extends State<SeedImportPhrase> {
  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext c) {
    final hasMaster = c.select((MasterKeyCubit mk) => mk.state.key != null);
    final state = c.select((SeedImportCubit _) => _.state);

    return BlocListener<SeedImportCubit, SeedImportState>(
      listener: (c, s) {
        s.showSeedCompleteButton();
      },
      child: Column(
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
          if (state.showSeedCompleteButton())
            AnimatedOpacity(
              opacity: 1,
              duration: const Duration(milliseconds: 300),
              child: SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: c.colours.background,
                    backgroundColor: c.colours.primary,
                  ),
                  onPressed: () {
                    final FocusScopeNode currentFocus = FocusScope.of(c);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    if (!hasMaster) {
                      if (state.showSeedCompleteButton()) {
                        c.read<SeedImportCubit>().checkSeed();
                        c.read<SeedImportWalletCubit>().nextClicked();
                      }
                    } else {
                      if (state.showSeedCompleteButton()) {
                        c.read<SeedImportCubit>().gotoPassPhrase();
                      }
                    }
                  },
                  child: const Text('Next'),
                ),
              ),
            ),
          const SizedBox(height: 40),
          //if (!state.showSeedCompleteButton())
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: BuiltInKeyboard(
              color: c.colours.primary,
              width: 26,
              height: 45,
              letterStyle: TextStyle(fontSize: 20, color: c.colours.background),
              borderRadius: BorderRadius.circular(1),
              controller: textController,
              enableSpaceBar: true,
            ),
          ),
        ],
      ),
    );
  }
}
