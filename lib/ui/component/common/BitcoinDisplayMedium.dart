import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/validation.dart';

class BitcoinDisplayMedium extends StatelessWidget {
  const BitcoinDisplayMedium({
    Key? key,
    required this.satsAmount,
    required this.bitcoinUnit,
  }) : super(key: key);

  final String satsAmount;
  final String bitcoinUnit;

  @override
  Widget build(BuildContext c) {
    if (bitcoinUnit == 'sats')
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            Validation.formatSatsString(satsAmount) + ' sats',
            style: c.fonts.headline6!.copyWith(
              color: c.colours.onPrimary,
              letterSpacing: 1,
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            satsAmount.toBtc() + ' BTC',
            style: c.fonts.headline6!.copyWith(
              color: c.colours.onPrimary,
              letterSpacing: 1,
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
