import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/pkg/extensions.dart';

class PinKeypad extends StatelessWidget {
  const PinKeypad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pinCubit = context.select((PinCubit pc) => pc);

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
            if (pinCubit.state.value == null && !pinCubit.state.hasChosenPin)
              pinCubit.addToChosenPin(value);

            if (pinCubit.state.hasChosenPin) pinCubit.addToConfPin(value);
          },
          rightButtonFn: () {
            if (pinCubit.state.value == null && !pinCubit.state.hasChosenPin)
              pinCubit.deleteOneFromChosenPin();

            if (pinCubit.state.hasChosenPin) pinCubit.deleteOneFromConfPin();
          },
          leftButtonFn: () {
            if (pinCubit.state.value == null && !pinCubit.state.hasChosenPin)
              pinCubit.clearChosenPin();

            if (pinCubit.state.hasChosenPin) pinCubit.clearConfPin();
          },
        ),
      ],
    );
  }
}
