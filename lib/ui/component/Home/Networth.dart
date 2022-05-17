import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/cubit/fees.dart';
import 'package:intl/intl.dart';

class Networth extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    // c.select((FeesCubit wc) => wc.update());
    final wallets = c.select((WalletsCubit w) => w.state.wallets);

    int networth = 0;
    for (final wallet in wallets) {
      networth += wallet.balance;
    }
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        left: 24,
        right: 32,
      ),
      child: Column(
        children: [
          Text(
            NumberFormat('###,000').format(double.parse(networth.toString())),
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

          // const SizedBox(width: 16),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.hide_source,
              size: 24,
              color: c.colours.primary,
            ),
          ),
        ],
      ),
    );
  }
}
