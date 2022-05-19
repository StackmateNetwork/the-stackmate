import 'package:flutter/material.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/validation.dart';

class Networth extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    // c.select((FeesCubit wc) => wc.update());
    final wallets = c.select((WalletsCubit w) => w.state.wallets);
    final fees = c.select((FeesCubit f) => f.state);
    late String networkTraffic;
    if (fees.fees.fast < 5)
      networkTraffic = "LOW";
    else if (fees.fees.fast > 5 && fees.fees.fast < 25)
      networkTraffic = "MEDIUM";
    else
      networkTraffic = "HIGH";

    int networth = 0;
    for (final wallet in wallets) {
      networth += wallet.balance;
    }
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      builder: (context, prefState) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 36,
            left: 24,
            right: 32,
          ),
          child: Column(
            children: [
              if (prefState.incognito) ...[
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
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
              ] else ...[
                Text(
                  Validation.formatSatsString(networth.toString()),
                  style: c.fonts.headline4!.copyWith(
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'sats',
                  style: c.fonts.headline6!.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  networth.toBtc() + ' BTC',
                  style: c.fonts.caption!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
