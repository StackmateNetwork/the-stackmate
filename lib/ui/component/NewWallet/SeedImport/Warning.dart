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
MAKE SURE you only type your seed manually.

We enforce incognito mode on your keyboard so typing your seed phrase is a bit safer.

NEVER copy/paste it via your clipboard.

Android uses GBoard by deafult with analytics, so consider disabling it or entirely
opting out and using OpenBoards. 

Incognito mode has your back for now.
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
              primary: c.colours.primary,
              onPrimary: c.colours.background,
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
