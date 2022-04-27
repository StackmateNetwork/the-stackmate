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
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '''
You will now be prompted to write down your seed.

Stackmate can currently only recovers segwit native wallets.
      ''',
            style: c.fonts.caption!.copyWith(
              color: Colors.white,
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
