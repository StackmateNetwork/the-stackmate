import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-new-seed.dart';
import 'package:sats/pkg/extensions.dart';

class SeedGenerateWarning extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Text(
          'Security\nInformation'.toUpperCase(),
          style: c.fonts.headline5!.copyWith(
            color: c.colours.onPrimary,
            // fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          '''
DO NOT TYPE THE FOLLOWING ON A KEYBOARD OR CREATE DIGITAL COPIES OF IT.

Note down your seed phrase (and optional passphrase) on a piece of paper/card/steel
and store in a safe place.

In case your device resets or fails, you will need it to recover your wallet on a 
new device.

      ''',
          style: c.fonts.caption!.copyWith(color: c.colours.onPrimary),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: c.colours.primary,
              onPrimary: c.colours.background,
            ),
            onPressed: () {
              c.read<SeedGenerateWalletCubit>().nextClicked();
            },
            child: Text(
              'I Understand'.toUpperCase().notLocalised(),
            ),
          ),
        ),
      ],
    );
  }
}
