import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/pkg/extensions.dart';

class Balance extends StatelessWidget {
  const Balance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final balance = c.select((InfoCubit hc) => hc.state.balance);

    return FadeIn(
      child: Padding(
        padding: const EdgeInsets.only(top: 52),
        child: Column(
          children: [
            Text(
              NumberFormat('###,000').format(double.parse(balance.toString())),
              style: c.fonts.headline4!.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              'sats',
              style: c.fonts.headline6!.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              balance.toBtc() + ' BTC',
              style: c.fonts.caption!.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
