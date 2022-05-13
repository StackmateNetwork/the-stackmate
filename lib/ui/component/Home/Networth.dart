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
      final balance = wallet.balance!;

      if (balance != null ) {
        networth += balance;
      }
    }
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 32,
      ),
      child: Row(
        children: [
          Text(
            (networth > 0)
                ? NumberFormat('###,000')
                        .format(double.parse(networth.toString())) +
                    ' sats'
                : '0 sats',
            style: c.fonts.bodyMedium!.copyWith(
              color: Colors.white,
              fontSize: 21,
            ),
          ),
          const Spacer(),
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
