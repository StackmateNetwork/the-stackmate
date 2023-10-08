import 'package:flutter/material.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/BitcoinDisplayLarge.dart';

class Networth extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    // c.select((FeesCubit wc) => wc.update());
    final networth = c.select((WalletsCubit w) => w.state.networth);
    final networkTraffic = c.select((FeesCubit f) => f.state.networkStrength);
    final preferences = c.select((PreferencesCubit p) => p.state);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (preferences.incognito) ...[
          Icon(
            Icons.network_ping,
            size: 32,
            color: (networkTraffic == 'LOW')
                ? c.colours.tertiary
                : (networkTraffic == 'MEDIUM')
                    ? c.colours.secondary
                    : c.colours.error,
          ),
          Text(
            networkTraffic + ' NETWORK TRAFFIC',
            style: c.fonts.bodySmall!.copyWith(
              color: c.colours.onPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ] else ...[
          GestureDetector(
            onTap: () {
              c.read<PreferencesCubit>().preferredBitcoinUnitChanged();
            },
            child: BitcoinDisplayLarge(
              satsAmount: networth.toString(),
              bitcoinUnit: preferences.preferredBitcoinUnit,
            ),
          ),
        ],
      ],
    );
  }
}
