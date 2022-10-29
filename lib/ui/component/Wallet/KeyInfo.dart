import 'package:flutter/material.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/master.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/validation.dart';

class KeyInfo extends StatelessWidget {
  const KeyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final wallet = c.select((WalletsCubit wc) => wc.state.selectedWallet!);
    final masterKey = c.select((MasterKeyCubit mk) => mk.state.key);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WALLET INFORMATION',
            style: c.fonts.overline!.copyWith(
              color: c.colours.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Kind',
            style: c.fonts.overline!.copyWith(
              color: c.colours.onBackground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            wallet.walletType,
            style: c.fonts.caption!.copyWith(
              color: c.colours.onBackground,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Script Type',
            style: c.fonts.overline!.copyWith(
              color: c.colours.onBackground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            wallet.descriptor.startsWith('w') ? 'SEGWIT' : 'TAPROOT',
            style: c.fonts.caption!.copyWith(
              color: c.colours.onBackground,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Fingerprint',
            style: c.fonts.overline!.copyWith(
              color: c.colours.onBackground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            Validation.fingerPrintFromXKey(
              wallet.policyElements[0].split(':')[1],
            ),
            style: c.fonts.caption!.copyWith(
              color: c.colours.onBackground,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Extended Public Key',
            style: c.fonts.overline!.copyWith(
              color: c.colours.onBackground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            wallet.policyElements[0].split(':')[1],
            style: c.fonts.caption!.copyWith(
              color: c.colours.onBackground,
            ),
          ),
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              alignment: Alignment.centerLeft,
            ),
            onPressed: () {
              c
                  .read<WalletsCubit>()
                  .copyDescriptor(wallet.policyElements[0].split(':')[1]);
            },
            child: const Text('COPY'),
          ),
          const SizedBox(height: 24),
          if (wallet.walletType == 'PRIMARY')
            SizedBox(
              height: 52,
              width: c.width,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: c.colours.error,
                  onSurface: c.colours.background.withOpacity(0.38),
                ),
                onPressed: () {
                  peekSeed(c, masterKey!);
                },
                child: Text('PEEK SEED'.toUpperCase()),
              ),
            ),
        ],
      ),
    );
  }
}

Future<void> peekSeed(BuildContext context, MasterKey key) async {
  // final masterKey = context.select((MasterKeyCubit mk) => mk.state);

  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(24.0),
        insetPadding: const EdgeInsets.all(24.0),
        backgroundColor: context.colours.onPrimaryContainer,
        elevation: 2.0,
        title: Text(
          'MNEMONIC\nSEED',
          style: context.fonts.headline5!.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colours.onPrimary,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                key.seed!,
                style: context.fonts.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colours.onPrimary,
                ),
              ),
              const SizedBox(height: 12),
              if (key.hasPassphrase!) ...[
                Text(
                  'This wallet also needs a passphrase to be recovered.',
                  style: context.fonts.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colours.error,
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Got it!',
              style: context.fonts.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colours.primary,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
