import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/inheritance-with-old-seed.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Common/StepLine.dart';

class InheritanceStepper extends StatelessWidget {
  const InheritanceStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<InheritanceWithOldSeedCubit,
        InheritanceWithOldSeedState>(
      builder: (context, state) {
        // final stepLabel = state.currentStepLabel();
        final steps = InteritanceWithOldSeedWalletSteps.values.length;
        final idx = state.currentStep.index;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text(
            //   stepLabel,
            //   style: c.fonts.headline6!.copyWith(color: Colors.white),
            // ),
            // const SizedBox(height: 24),
            StepLine(length: steps, idx: idx),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}
