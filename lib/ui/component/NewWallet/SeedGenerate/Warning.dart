import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/cubit/new-wallet/from-new-seed.dart';
import 'package:sats/pkg/extensions.dart';

class SeedGenerateWarning extends StatelessWidget {
  final learnUrl = 'https://stackmate.org/primer';

  @override
  Widget build(BuildContext c) {
    final selectedSeedPhraseLength =
        c.select((SeedGenerateCubit sgc) => sgc.state.seedLength);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Text(
          'KEY\nSECURITY'.toUpperCase(),
          style: c.fonts.headline5!.copyWith(
            color: c.colours.onPrimary,
            // fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          '''
The following steps are critical to ensure safety of your funds.
      ''',
          style: c.theme.primaryTextTheme.bodyLarge!.copyWith(
            color: c.colours.onPrimary,
          ),
        ),
        GestureDetector(
          onTap: () {
            c.read<SeedGenerateCubit>().openLink(learnUrl);
          },
          child: Container(
            width: c.width / 2,
            child: Text(
              // transaction.txIdBlur(),
              'Click here to learn more.',
              style: c.theme.primaryTextTheme.bodyLarge!.copyWith(
                color: c.colours.primary,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          title: Text(
            '12 Words',
            style: c.fonts.bodyLarge!.copyWith(
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
        ListTile(
          selectedColor: c.colours.primary,
          selectedTileColor: c.colours.primary,
          title: Text(
            '24 Words',
            style: c.fonts.bodyLarge!.copyWith(
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
