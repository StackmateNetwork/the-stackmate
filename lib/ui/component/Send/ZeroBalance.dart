import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';

class ZeroBalance extends StatelessWidget {
  const ZeroBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zerobal = context.select((SendCubit sc) => sc.state.zeroBalanceAmt());

    if (zerobal)
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'You have\nZero\nBalance.',
          style: context.fonts.headline6!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
      );

    return Container();
  }
}
