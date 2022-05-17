import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';

class Networth extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    // c.select((FeesCubit wc) => wc.update());
    final wallets = c.select((WalletsCubit w) => w.state.wallets);

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
            if (prefState.incognito)
              Text(
                '"A specter is haunting the modern world, the specter of crypto anarchy. - May, 1988"',
                style: c.fonts.caption!.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              )
            else ...[
              Text(
                (networth > 0)
                    ? NumberFormat('###,000')
                        .format(double.parse(networth.toString()))
                    : '0 sats',
                style: c.fonts.headline4!.copyWith(
                  color: Colors.white,
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
    });
  }
}
