import 'package:flutter/material.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Home/WalletCard.dart';

class Accounts extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final wallets = c.select((WalletsCubit w) => w.state.wallets);

    if (wallets.isEmpty)
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Text(
              'No\nwallets\nadded',
              style: c.fonts.caption!.copyWith(
                color: c.colours.onBackground,
              ),
            ),
          ),
        ],
      );
    else
      return Container(
        width: c.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              for (var w in wallets) WalletCard(wallet: w),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );
  }
}
