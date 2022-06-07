import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/AddWallet/SelectButton.dart';

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
                  'A 12 word mnemonic seed phrase and optional passphrase represents your master key. It can recover all accounts created on this wallet.',
                  style: c.fonts.bodySmall!.copyWith(
                    color: c.colours.onPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
            if (masterKey == null) ...[
              const SizedBox(height: 16),
              SelectButton(
                text: 'New',
                description: 'Master key from a new mnemonic seed phrase.',
                colour: c.colours.surface,
                onPressed: () {
                  c.push('/generate-seed');
                },
              ),
              const SizedBox(height: 16),
              SelectButton(
                text: 'Import',
                description: 'Import master key from an existing seed phrase.',
                colour: c.colours.surface,
                onPressed: () {
                  c.push('/import-seed');
                },
              ),
            ],
            if (masterKey != null) ...[
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'From External Wallet'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
              ),
              SelectButton(
                text: 'Watcher',
                description:
                    'Import a public key or descriptor.\nMonitor your hardware signer.',
                colour: c.colours.surface,
                onPressed: () {
                  c.push('/watch-only');
                },
              ),
              SelectButton(
                text: 'Coldcard',
                description:
                    'Import a public key or descriptor.\nMonitor your hardware signer.',
                colour: c.colours.surface,
                onPressed: () {
                  c.push('/coldcard');
                },
              ),
              const SizedBox(height: 16),
              // SelectButton(
              //   text: 'Legacy (coming soon...)',
              //   description:
              //       'Derive a legacy ("1") account from your master key.',
              //   colour: c.colours.surface,
              //   onPressed: () {
              //     // c.push('/watch-only');
              //   },
              // ),
              // const SizedBox(height: 16),
              // SelectButton(
              //   text: 'Compatible (coming soon...)',
              //   description:
              //       'Derive a compatible ("3") account from your master key.',
              //   colour: c.colours.surface,
              //   onPressed: () {
              //     // c.push('/watch-only');
              //   },
              // ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'From Master Key'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.onBackground,
                  ),
                ),
              ),
              SelectButton(
                text: 'Taproot',
                description:
                    'Derive a taproot ("bc1p") account from your master key.\nCOMING SOON.',
                colour: c.colours.surface,
                onPressed: () {
                  // c.push('/watch-only');
                },
              ),
              const SizedBox(height: 16),
            ],
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
