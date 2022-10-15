import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/pkg/extensions.dart';

class SeedImportWarning extends StatelessWidget {
  const SeedImportWarning();
  @override
  Widget build(BuildContext c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Security\nInformation'.toUpperCase(),
          style: c.fonts.headline5!.copyWith(
            color: c.colours.onPrimary,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          '''
Incognito mode is enforced on your keyboard.
''',
          style: c.fonts.caption!.copyWith(
            color: c.colours.onPrimary,
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: c.colours.background,
              primary: c.colours.primary,
            ),
            onPressed: () => c.read<SeedImportWalletCubit>().nextClicked(),
            child: Text(
              'I Understand'.toUpperCase(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
