import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sats/cubit/wallet/history.dart';
import 'package:sats/pkg/extensions.dart';

class Balance extends StatelessWidget {
  const Balance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final balance = c.select((HistoryCubit hc) => hc.state.balance);
    if (balance == null) return Container();

    return FadeIn(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Balance'.toUpperCase(),
              style: c.fonts.overline!.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              NumberFormat('###,000').format(double.parse(balance.toString())) +
                  ' sats',
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
