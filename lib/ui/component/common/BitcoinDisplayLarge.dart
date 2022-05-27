import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/validation.dart';

class BitcoinDisplayLarge extends StatelessWidget {
  const BitcoinDisplayLarge({
    Key? key,
    required this.satsAmount,
    required this.bitcoinUnit,
  }) : super(key: key);

  final String satsAmount;
  final String bitcoinUnit;

  @override
  Widget build(BuildContext c) {
    // final btcAmount = int.parse(satsAmount) / 100000000;

    if (bitcoinUnit == 'sats')
      return Column(
        children: [
          Text(
            Validation.formatSatsString(satsAmount),
            style: c.fonts.headline4!.copyWith(
              color: c.colours.onPrimary,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'sats',
            style: c.fonts.headline6!.copyWith(
              color: c.colours.onPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            satsAmount.toBtc() + ' BTC',
            style: c.fonts.caption!.copyWith(
              color: c.colours.onPrimary,
            ),
          ),
        ],
      );
    else
      return Column(
        children: [
          Text(
            satsAmount.toBtc(),
            style: c.fonts.headline4!.copyWith(
              color: c.colours.onPrimary,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'BTC',
            style: c.fonts.headline6!.copyWith(
              color: c.colours.onPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            Validation.formatSatsString(satsAmount) + ' sats',
            style: c.fonts.caption!.copyWith(
              color: c.colours.onPrimary,
            ),
          ),
        ],
      );
  }
}
