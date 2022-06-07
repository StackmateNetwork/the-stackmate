import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-master-key.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/StepLine.dart';

class MasterDeriveStepper extends StatelessWidget {
  const MasterDeriveStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<MasterDeriveWalletCubit, MasterDeriveWalletState>(
      builder: (context, state) {
        final steps = MasterDeriveWalletStep.values.length;
        final idx = state.currentStep.index;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StepLine(length: steps, idx: idx),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}
