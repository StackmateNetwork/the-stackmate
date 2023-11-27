import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/derivation.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/StepLine.dart';

class DeriveStepper extends StatelessWidget {
  const DeriveStepper({super.key});

  @override
  Widget build(BuildContext c) {
    final state = c.select((DeriveWalletCubit d) => d.state);

    final steps = DeriveWalletStep.values.length;
    final idx = state.currentStep.index;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StepLine(length: steps, idx: idx),
        const SizedBox(height: 24),
      ],
    );
  }
}
