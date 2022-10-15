import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class EnterMyIdentity extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    const registered = false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (registered)
          // ignore: dead_code
          Text(
            'Registered as ishi.',
            style: c.fonts.caption!.copyWith(
              color: c.colours.primary,
            ),
            textAlign: TextAlign.center,
          )
        else ...[
          Text(
            'CYPHERPOST',
            style: c.fonts.caption!.copyWith(
              color: c.colours.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'cypherpost is a free and open-source\nend-to-end encrypted social networking protocol.',
            style: c.fonts.caption!.copyWith(
              color: c.colours.onPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
