import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/AddWallet/SelectButton.dart';
import 'package:sats/ui/component/Common/BackButton.dart';
import 'package:sats/ui/component/Common/LogButton.dart';

class AddWalletScreen extends StatelessWidget {
  const AddWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final masterKey = c.select((MasterKeyCubit mc) => mc.state.key);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: (masterKey == null)
                  ? Text(
                      'Create\nMaster Key'.toUpperCase(),
                      textAlign: TextAlign.left,
                      style: c.fonts.headline5!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    )
                  : Text(
                      'Add\nAccount'.toUpperCase(),
                      textAlign: TextAlign.left,
                      style: c.fonts.headline5!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
            ),
            if (masterKey == null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Your master key will be used to manage your social accounts and hot wallets.',
                  style: c.fonts.bodySmall!.copyWith(
                    color: c.colours.onPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
            if (masterKey != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'SINGLE SIGNATURE',
                  style: c.fonts.overline!.copyWith(
                    color: c.colours.onPrimary,
                  ),
                ),
              ),
            if (masterKey == null) ...[
              const SizedBox(height: 16),
              SelectButton(
                text: 'New',
                description: 'Generate a new mnemonic seed phrase.',
                colour: c.colours.surface,
                onPressed: () {
                  c.push('/generate-seed');
                },
              ),
            ],
            const SizedBox(height: 16),
            SelectButton(
              text: 'Recover',
              description:
                  'Recover an account from a seed.\nOnly use for emergency.',
              colour: c.colours.surface,
              onPressed: () {
                c.push('/import-seed');
              },
            ),
            if (masterKey != null) ...[
              const SizedBox(height: 16),
              SelectButton(
                text: 'Watcher',
                description:
                    'Import a public key.\nMonitor your hardware signer.',
                colour: c.colours.surface,
                onPressed: () {
                  c.push('/watch-only');
                },
              ),
            ],
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
