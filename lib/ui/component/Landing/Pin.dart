import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/pkg/extensions.dart';

class PIN extends StatefulWidget {
  const PIN({Key? key}) : super(key: key);

  @override
  PINState createState() => PINState();
}

class PINState extends State<PIN> {
  String pinText = '';
  String hidden = '';

  @override
  Widget build(BuildContext context) {
    final pinCubit = context.select((PinCubit pc) => pc);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          hidden,
          style: context.fonts.headline5!.copyWith(
            color: context.colours.onPrimary,
          ),
        ),
        NumericKeyboard(
          onKeyboardTap: _onKeyboardTap,
          textColor: Colors.white,
          rightButtonFn: () {
            setState(() {
              pinText = pinText.substring(0, pinText.length - 1);
              hidden = hidden.substring(0, hidden.length - 1);
              if (pinText.length == 4) {
                pinCubit.setConfirmedPin(pinText);
              }
            });
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
                pinCubit.setChosenPin(pinText);
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
                pinCubit.setConfirmedPin(pinText);
                pinCubit.verifyChosenPin();
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

  // ignore: always_declare_return_types
  _onKeyboardTap(String value) {
    setState(() {
      if (pinText.length == 4) {
      } else {
        pinText = pinText + value;
        hidden = hidden + '*';
      }
    });
  }
}
