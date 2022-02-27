import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';

class WalletDetails extends StatelessWidget {
  const WalletDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final walletName = context.select(
    //   (WalletsCubit wc) => wc.state.selectedWallet!.label,
    // );
    final balance = context.select((SendCubit sc) => sc.state.balance);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Text(
        //   walletName,
        //   style: context.fonts.headline5!.copyWith(
        //     color: context.colours.onBackground,
        //   ),
        // ),
        // const SizedBox(height: 40),
        if (balance != null) ...[
          Text(
            'Balance'.toUpperCase(),
            style: context.fonts.overline!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          Text(
            balance.toString() + ' sats',
            style: context.fonts.headline6!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          Text(
            balance.toBtc() + ' BTC',
            style: context.fonts.caption!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
        ],
      ],
    );
  }
}
