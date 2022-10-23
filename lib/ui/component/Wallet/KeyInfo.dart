import 'package:flutter/material.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';

class KeyInfo extends StatelessWidget {
  const KeyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final wallet = c.select((WalletsCubit wc) => wc.state.selectedWallet!);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'KEY INFORMATION',
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
        ],
      ),
    );
  }
}
