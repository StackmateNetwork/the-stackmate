import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/pkg/extensions.dart';

class SeedImportWarning extends StatelessWidget {
  const SeedImportWarning();
  @override
  Widget build(BuildContext c) {
    return SingleChildScrollView(
      child: Column(
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
You will now be prompted to enter your private key data.

Use whatever you have and we will attempt to recover any associated spendable funds.
      ''',
            style: c.fonts.caption!.copyWith(
              color: c.colours.onPrimary,
            ),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              c.read<SeedImportWalletCubit>().nextClicked();
            },
            child: Text('I Understand'.toUpperCase()),
          )
        ],
      ),
    );
  }
}
