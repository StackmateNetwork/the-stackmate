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
  String text = '';
  String hidden = '';

  @override
  Widget build(BuildContext context) {
    final pinCubit = context.select((PinCubit pc) => pc);
    final masterKey = context.select((MasterKeyCubit mc) => mc.state.key);

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
              text = text.substring(0, text.length - 1);
              hidden = hidden.substring(0, hidden.length - 1);
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
        (pinCubit.state.value == null)
            ? SizedBox(
                height: 72,
                width: context.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: context.colours.background,
                    primary: context.colours.primary,
                  ),
                  onPressed: () {
                    pinCubit.saveNewPin(text);
                  },
                  child: const Text('SET'),
                ),
              )
            : SizedBox(
                height: 72,
                width: context.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: context.colours.primary,
                    primary: context.colours.background,
                  ),
                  onPressed: () async {
                    final status = true | await pinCubit.checkPin(text);
                    if (status) {
                      // cubit updated, must unlock start button.
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
                  child: const Text('SET'),
                ),
              ),
      ],
    );
  }

  // ignore: always_declare_return_types
  _onKeyboardTap(String value) {
    setState(() {
      if (text.length == 4) {
      } else {
        text = text + value;
        hidden = hidden + '*';
      }
    });
  }
}
