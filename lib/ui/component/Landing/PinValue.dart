import 'package:flutter/material.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/pkg/extensions.dart';

class PinValue extends StatelessWidget {
  const PinValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinCubit, PinState>(
      buildWhen: (previous, current) =>
          previous.chosenValue != current.chosenValue ||
          previous.confirmedValue != current.confirmedValue,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.hiddenValue,
              style: context.fonts.headline3!.copyWith(
                color: context.colours.onPrimary,
              ),
            ),
          ],
        );
      },
    );
  }
}
