import 'package:flutter/material.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Home/WalletCard.dart';

class Accounts extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final wallets = c.select((WalletsCubit w) => w.state.wallets);
    if (wallets.isEmpty)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 66),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'No\nwallets\nadded',
              style: c.fonts.caption!.copyWith(
                color: c.colours.onBackground,
              ),
            ),
          ),
        ],
      );
    return Container(
      width: c.width,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            for (var w in wallets) WalletCard(wallet: w),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
