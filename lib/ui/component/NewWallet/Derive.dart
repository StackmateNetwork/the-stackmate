import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/derivation.dart';
// import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/NewWallet/Derive/Label.dart';
import 'package:sats/ui/component/NewWallet/Derive/Passphrase.dart';

class DeriveSteps extends StatelessWidget {
  const DeriveSteps({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final step = context.select((DeriveWalletCubit sc) => sc.state.currentStep);
    switch (step) {
      case DeriveWalletStep.purpose:
        return const DerivePurpose();
      case DeriveWalletStep.passphrase:
        return DerivePassphrase();
      // case DeriveWalletStep.idx:
      //   return const DeriveIndex();
      case DeriveWalletStep.label:
        return const DeriveLabel();
    }
  }
}

class DerivePurpose extends StatelessWidget {
  const DerivePurpose();

  @override
  Widget build(BuildContext c) {
    // final wallets = c.select((WalletsCubit wc) => wc.state.wallets);
    final selectedPurpose =
        c.select((DeriveWalletCubit mdw) => mdw.state.purpose);
    return BlocBuilder<DeriveWalletCubit, DeriveWalletState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose Purpose:',
              style: c.fonts.headline5!.copyWith(
                color: c.colours.onPrimary,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ListTile(
              title: Text(
                'Taproot',
                style: c.fonts.bodyMedium!.copyWith(
                  color: c.colours.onPrimary,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio<DerivationPurpose>(
                activeColor: c.colours.primary,
                value: DerivationPurpose.taproot,
                groupValue: selectedPurpose,
                onChanged: (DerivationPurpose? value) {
                  c
                      .read<DeriveWalletCubit>()
                      .purposeChanged(DerivationPurpose.taproot);
                },
              ),
            ),
            ListTile(
              selectedColor: c.colours.primary,
              selectedTileColor: c.colours.primary,
              title: Text(
                'Segwit',
                style: c.fonts.bodyMedium!.copyWith(
                  color: c.colours.onPrimary,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio<DerivationPurpose>(
                activeColor: c.colours.primary,
                value: DerivationPurpose.segwit,
                groupValue: selectedPurpose,
                onChanged: (DerivationPurpose? value) {
                  c
                      .read<DeriveWalletCubit>()
                      .purposeChanged(DerivationPurpose.segwit);
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: c.colours.background,
                  primary: c.colours.primary,
                ),
                onPressed: () {
                  c.read<DeriveWalletCubit>().nextClicked();
                },
                child: const Text('CONFIRM'),
              ),
            ),
          ],
        );
      },
    );
  }
}
