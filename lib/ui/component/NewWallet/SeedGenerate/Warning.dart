import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/cubit/new-wallet/from-new-seed.dart';
import 'package:sats/pkg/extensions.dart';

class SeedGenerateWarning extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final selectedSeedPhraseLength =
        c.select((SeedGenerateCubit sgc) => sgc.state.seedLength);
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
DO NOT TYPE YOUR SEED WORDS ON A KEYBOARD OR CREATE DIGITAL COPIES OF IT.

Note it down (with your optional passphrase) on a piece of paper/card/steel
and store in a safe place.

In case your device resets or fails, you will need it to recover your wallet on a 
new device.
      ''',
          style: c.fonts.caption!.copyWith(color: c.colours.onPrimary),
        ),
        const SizedBox(height: 16),
        ListTile(
          title: Text(
            '12 Words',
            style: c.fonts.bodyMedium!.copyWith(
              color: c.colours.onPrimary,
              // fontWeight: FontWeight.bold,
            ),
          ),
          leading: Radio<int>(
            activeColor: c.colours.primary,
            value: 12,
            groupValue: selectedSeedPhraseLength,
            onChanged: (int? value) {
              c.read<SeedGenerateCubit>().seedLengthChanged(12);
            },
          ),
        ),
        Text(
          '''
12 Words is strong enough and easy to memorize. Passphrase is recommended to make it bullet-proof. Make the passphrase easy to access, like a passage from your favorite book or a song.
      ''',
          style: c.fonts.caption!.copyWith(color: c.colours.onPrimary),
        ),
        ListTile(
          selectedColor: c.colours.primary,
          selectedTileColor: c.colours.primary,
          title: Text(
            '24 Words',
            style: c.fonts.bodyMedium!.copyWith(
              color: c.colours.onPrimary,
              // fontWeight: FontWeight.bold,
            ),
          ),
          leading: Radio<int>(
            activeColor: c.colours.primary,
            value: 24,
            groupValue: selectedSeedPhraseLength,
            onChanged: (int? value) {
              c.read<SeedGenerateCubit>().seedLengthChanged(24);
            },
          ),
        ),
        Text(
          '''
24 Words offers the highest grade of security.\n
      ''',
          style: c.fonts.caption!.copyWith(color: c.colours.onPrimary),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: c.colours.background,
              primary: c.colours.primary,
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
