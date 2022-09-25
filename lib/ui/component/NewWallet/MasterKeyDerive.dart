import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-master-key.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/NewWallet/MasterKeyDerive/Label.dart';

class MasterDeriveSteps extends StatelessWidget {
  const MasterDeriveSteps({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final step =
        context.select((MasterDeriveWalletCubit sc) => sc.state.currentStep);
    switch (step) {
      case MasterDeriveWalletStep.purpose:
        return const MasterDerivePurpose();
      case MasterDeriveWalletStep.label:
        return const MasterDeriveLabel();
    }
  }
}

class MasterDerivePurpose extends StatelessWidget {
  const MasterDerivePurpose();

  @override
  Widget build(BuildContext c) {
    final wallets = c.select((WalletsCubit wc) => wc.state.wallets);
    var hasSegwit = false;
    var hasTaproot = false;
    for (final wallet in wallets) {
      if (wallet.descriptor.startsWith('tr')) hasTaproot = true;
      if (wallet.descriptor.startsWith('wpkh')) hasSegwit = true;
    }
    final selectedPurpose =
        c.select((MasterDeriveWalletCubit mdw) => mdw.state.purpose);
    return BlocBuilder<MasterDeriveWalletCubit, MasterDeriveWalletState>(
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
            if (!hasTaproot)
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
                        .read<MasterDeriveWalletCubit>()
                        .purposeChanged(DerivationPurpose.taproot);
                  },
                ),
              ),
            if (!hasSegwit)
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
                        .read<MasterDeriveWalletCubit>()
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
                  foregroundColor: c.colours.background,
                  backgroundColor: c.colours.primary,
                ),
                onPressed: () {
                  c.read<MasterDeriveWalletCubit>().nextClicked();
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
