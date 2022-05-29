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
    final wallets = c.select((WalletsCubit w) => w.state.wallets);
    final fees = c.select((FeesCubit f) => f.state);
    final preferences = c.select((PreferencesCubit p) => p);

    late String networkTraffic;
    if (fees.fees.fast < 5)
      networkTraffic = 'LOW';
    else if (fees.fees.fast > 5 && fees.fees.fast < 25)
      networkTraffic = 'MEDIUM';
    else
      networkTraffic = 'HIGH';

    int networth = 0;
    // THIS WILL ONLY WORK FOR SINGLE SIGS
    // SCRIPTS NEED TO CHECK PUBLIC DESCRIPTOR
    final existingPubkeys = [];
    for (final wallet in wallets) {
      if (!existingPubkeys.contains(wallet.policyElements[0])) {
        existingPubkeys.add(wallet.policyElements[0]);
        networth += wallet.balance;
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (preferences.state.incognito) ...[
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
            style: c.fonts.caption!.copyWith(
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
              bitcoinUnit: preferences.state.preferredBitcoinUnit,
            ),
          ),
        ],
      ],
    );
  }
}
