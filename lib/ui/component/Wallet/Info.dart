import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';

class WalletInfo extends StatelessWidget {
  const WalletInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final wallet = c.select((WalletsCubit wc) => wc.state.selectedWallet!);

    return FadeIn(
      delay: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'WALLET\nINFORMATION',
              style: c.fonts.overline!.copyWith(
                color: c.colours.onBackground,
                fontWeight: FontWeight.bold,
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
            Text(
              'Only your mnemonic and passphrase are enough to recover this wallet.',
              style: c.fonts.caption!.copyWith(
                color: c.colours.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
