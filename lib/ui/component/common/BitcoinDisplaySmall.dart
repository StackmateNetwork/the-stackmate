import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/validation.dart';

class BitcoinDisplaySmall extends StatelessWidget {
  const BitcoinDisplaySmall({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Validation.formatSatsString(satsAmount) + ' sats',
            style: c.fonts.bodyMedium!.copyWith(
              color: c.colours.onPrimary,
              letterSpacing: 1,
            ),
          ),
        ],
      );
    else
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            satsAmount.toBtc() + ' BTC',
            style: c.fonts.bodyMedium!.copyWith(
              color: c.colours.onPrimary,
              letterSpacing: 1,
            ),
          ),
        ],
      );
  }
}
