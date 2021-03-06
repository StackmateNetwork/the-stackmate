import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/AddWallet/SelectButton.dart';
import 'package:sats/ui/component/common/BackButton.dart';
import 'package:sats/ui/component/common/header.dart';

class AddWalletScreen extends StatelessWidget {
  const AddWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final masterKey = c.select((MasterKeyCubit mc) => mc.state.key);
    final wallets = c.select((WalletsCubit wc) => wc.state);
    var hasSegwit = false;
    var hasTaproot = false;
    for (final wallet in wallets.wallets) {
      if (wallet.descriptor.startsWith('tr')) hasTaproot = true;
      if (wallet.descriptor.startsWith('wpkh')) hasSegwit = true;
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            if (masterKey == null)
              Header(
                cornerTitle: 'Master Key'.toUpperCase(),
                children: [
                  Back(
                    onPressed: () {
                      Navigator.pop(c);
                    },
                  ),
                ],
              )
            else
              Header(
                cornerTitle: 'Add Account'.toUpperCase(),
                children: [
                  Back(
                    onPressed: () {
                      Navigator.pop(c);
                    },
                  ),
                ],
              ),
            const SizedBox(height: 24),
            if (masterKey == null) ...[
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'A 12 word mnemonic seed phrase and optional passphrase represents your master key. You can use it to recover your funds on any Bitcoin wallet.',
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
                description: 'New Master key from a new mnemonic seed.',
                colour: c.colours.surface,
                onPressed: () {
                  c.push('/generate-seed');
                },
              ),
              const SizedBox(height: 16),
              SelectButton(
                text: 'Import',
                description: 'Import Master key from an existing seed.',
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
                  'WATCHER'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.secondary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SelectButton(
                text: 'Coldcard',
                description: 'Import a generic.json from your ColdCard.',
                colour: c.colours.surface,
                onPressed: () {
                  c.push('/coldcard');
                },
              ),
              const SizedBox(height: 8),
              SelectButton(
                text: 'Manual',
                description:
                    'Import a raw public key.\nMonitor any hardware if your know what youre doing.',
                colour: c.colours.surface,
                onPressed: () {
                  c.push('/watch-only');
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
                  'SIGNER'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: c.fonts.caption!.copyWith(
                    color: c.colours.tertiary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              if (!hasTaproot || !hasSegwit)
                SelectButton(
                  text: 'DERIVE',
                  description:
                      'Derive a taproot ("bc1p") or segwit ("bc1q") account from your master key.',
                  colour: c.colours.surface,
                  onPressed: () {
                    c.push('/derive-account');
                  },
                ),
              const SizedBox(height: 16),
              SelectButton(
                text: 'RECOVER',
                description: 'Recover a wallet from an existing seed.',
                colour: c.colours.surface,
                onPressed: () {
                  c.push('/import-seed');
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
