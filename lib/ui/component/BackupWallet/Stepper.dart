import 'package:flutter/material.dart';
import 'package:sats/cubit/seed-backup.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/StepLine.dart';

class BackupWalletStepper extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    return BlocBuilder<SeedBackupCubit, SeedBackupState>(
      buildWhen: (previous, current) =>
          previous.currentStep != current.currentStep,
      builder: (context, state) {
        final steps = SeedBackupSteps.values.length;
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
