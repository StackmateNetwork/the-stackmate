import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/pkg/extensions.dart';

class PIN extends StatelessWidget {
  const PIN({Key? key}) : super(key: key);
  void initState() {
    initState();
  }

  @override
  Widget build(BuildContext context) {
    final pinCubit = context.select((PinCubit pc) => pc);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          hidden,
          style: context.fonts.headline5!.copyWith(
            color: context.colours.primary,
          ),
        ),
        NumericKeyboard(
          onKeyboardTap: pinCubit.onKeyboardTap,
          textColor: Colors.white,
          rightButtonFn: () {
            pinText = pinText.substring(0, pinText.length - 1);
            hidden = hidden.substring(0, hidden.length - 1);
            if (pinText.length == 4) {
              pinCubit.setConfirmedPin(pinText);
            }
          },
          rightIcon: const Icon(
            Icons.backspace,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        // ignore: prefer_if_elements_to_conditional_expressions
        if (pinCubit.state.value == null && pinCubit.state.chosenValue == '')
          SizedBox(
            height: 72,
            width: context.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: context.colours.background,
                primary: context.colours.primary,
              ),
              onPressed: () {
                context.read<PinCubit>().setChosenPin(pinText);
              },
              child: const Text('SET'),
            ),
          ),
        if (pinCubit.state.value == null && pinCubit.state.chosenValue != '')
          SizedBox(
            height: 72,
            width: context.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: context.colours.primary,
                primary: context.colours.background,
              ),
              onPressed: () async {
                context.read<PinCubit>().setConfirmedPin(pinText);
                context.read<PinCubit>().verifyChosenPin();
                // pinCubit.setConfirmedPin(pinText);
                //  pinCubit.verifyChosenPin();
                if (pinCubit.state.isVerified) {
                  // cubit updated, must unlock start button.
                  await pinCubit.saveNewPin(pinText);
                } else {
                  final snackBar = SnackBar(
                    content: Text(
                      'Bad PIN!',
                      style: context.fonts.headline5!.copyWith(
                        color: context.colours.error,
                      ),
                    ),
                    duration: const Duration(seconds: 1),
                    backgroundColor: context.colours.background,
                    //default is 4s
                  );
                  // ignore: deprecated_member_use
                  Scaffold.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('CONFIRM'),
            ),
          ),
      ],
    );
  }
}
