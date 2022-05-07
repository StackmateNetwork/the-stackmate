import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';

class WalletDetails extends StatelessWidget {
  const WalletDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final balance = context.select((SendCubit sc) => sc.state.balance);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (balance != null) ...[
          Text(
            'Balance'.toUpperCase(),
            style: context.fonts.overline!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          Text(
            NumberFormat.decimalPattern()
                    .format(double.parse(balance.toString())) +
                ' sats',
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
