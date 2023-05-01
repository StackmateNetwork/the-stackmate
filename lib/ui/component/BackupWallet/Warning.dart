import 'package:flutter/material.dart';
import 'package:sats/cubit/seed-backup.dart';
import 'package:sats/pkg/extensions.dart';

class SeedBackupWarning extends StatelessWidget {
  final learnUrl = 'https://stackmate.org/primer';

  @override
  Widget build(BuildContext c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Text(
          'Security\nInformation'.toUpperCase(),
          style: c.fonts.headlineSmall!.copyWith(
            color: c.colours.onPrimary,
            // fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          '''
The following steps are critical to ensure safe recovery of your funds.
      ''',
          style: c.theme.primaryTextTheme.bodyLarge!
              .copyWith(color: c.colours.onPrimary),
        ),
        GestureDetector(
          onTap: () {
            c.read<SeedBackupCubit>().openLink(learnUrl);
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
        const SizedBox(height: 48),
        SizedBox(
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: c.colours.background, backgroundColor: c.colours.primary,
            ),
            onPressed: () {
              c.read<SeedBackupCubit>().nextClicked();
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
