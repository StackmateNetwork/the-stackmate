import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
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
        SizedBox(
          height: 72,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: context.colours.background,
              primary: context.colours.primary,
            ),
            onPressed: () {},
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
