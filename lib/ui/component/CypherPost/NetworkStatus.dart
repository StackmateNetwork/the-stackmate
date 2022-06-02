import 'package:flutter/material.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/BitcoinDisplayLarge.dart';
import 'package:go_router/go_router.dart';

class NetworkStatus extends StatelessWidget {
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
            'cypherpost is a free and open-source\nend-to-end encrypted social networking protocol.',
            style: c.fonts.caption!.copyWith(
              color: c.colours.onPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: c.colours.primary,
              onPrimary: c.colours.background,
            ),
            onPressed: () async {
              c.push('/register');
            },
            child: const Text('REGISTER'),
          ),
        ],
      ],
    );
  }
}
