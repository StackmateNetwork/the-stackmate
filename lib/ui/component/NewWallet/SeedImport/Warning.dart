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
Typing your private key data or copying it via a clipboard makes it vulnerable
to a larger attack surface.

Android uses GBoard by deafult with analytics, consider disabling it or entirely
opting out and using OpenBoards.
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
