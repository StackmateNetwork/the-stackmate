import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/pkg/extensions.dart';

class PinKeypad extends StatelessWidget {
  const PinKeypad({super.key});

  @override
  Widget build(BuildContext context) {
    final pinCubit = context.select((PinCubit pc) => pc);

    return BlocBuilder<PinCubit, PinState>(
      buildWhen: (previous, current) =>
          previous.hasChosenPin != current.hasChosenPin,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumericKeyboard(
              textColor: Colors.white,
              rightIcon: Icon(
                Icons.backspace,
                color: context.colours.onPrimary,
              ),
              leftIcon: Icon(
                Icons.cancel,
                color: context.colours.error,
              ),
              onKeyboardTap: (String value) {
                if (state.value == null && !state.hasChosenPin)
                  pinCubit.addToChosenPin(value);

                if (state.hasChosenPin) pinCubit.addToConfPin(value);
              },
              rightButtonFn: () {
                if (state.value == null && !state.hasChosenPin)
                  pinCubit.deleteOneFromChosenPin();

                if (state.hasChosenPin) pinCubit.deleteOneFromConfPin();
              },
              leftButtonFn: () {
                if (state.value == null && !state.hasChosenPin)
                  pinCubit.clearChosenPin();

                if (state.hasChosenPin) pinCubit.clearConfPin();
              },
            ),
          ],
        );
      },
    );
  }
}
