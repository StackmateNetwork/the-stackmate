import 'package:flutter/material.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/pkg/extensions.dart';

class PinValue extends StatelessWidget {
  const PinValue({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinCubit, PinState>(
      buildWhen: (previous, current) =>
          previous.setValue != current.setValue ||
          previous.enteredValue != current.enteredValue ||
          previous.hiddenValue != current.hiddenValue ||
          previous.confirmedValue != current.confirmedValue,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.hiddenValue,
              style: context.fonts.displaySmall!.copyWith(
                color: context.colours.onPrimary,
              ),
            ),
          ],
        );
      },
    );
  }
}
