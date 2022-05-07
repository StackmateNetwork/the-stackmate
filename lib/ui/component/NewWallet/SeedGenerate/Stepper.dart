import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/from-new-seed.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Common/StepLine.dart';

class GenerateWalletStepper extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return BlocBuilder<SeedGenerateWalletCubit, SeedGenerateWalletState>(
      buildWhen: (previous, current) =>
          previous.currentStep != current.currentStep,
      builder: (context, state) {
        final steps = SeedGenerateWalletSteps.values.length;
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
