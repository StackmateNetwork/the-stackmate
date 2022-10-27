import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/pkg/extensions.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pinCubit = context.select((PinCubit pc) => pc);
    final masterKey = context.select((MasterKeyCubit mc) => mc.state.key);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          hidden,
          style: context.fonts.headline5!.copyWith(
            color: context.colours.primary,
          ),
        ),
        NumericKeyboard(
          onKeyboardTap: (String value) {
            if (pinText.length == 4)
              pinText = pinText + value;
            else {
              pinText = pinText + value;
              hidden = hidden + '*';
            }
          },
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
        SizedBox(
          height: 72,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: context.colours.background,
              primary: context.colours.primary,
            ),
            onPressed: () async {
              // CHECK IF PIN IS VERIFIED
              await pinCubit.checkPin(pinCubit.state.confirmedValue);

              if (pinCubit.state.isVerified) {
                pinCubit
                    .init(); // reset pinCubit state with init() so that isVerified is back to false
                if (masterKey != null) {
                  context.push('/home');
                }
                if (masterKey == null) {
                  context.push('/add-wallet');
                }
              }
            },
            child: const Text('START'),
          ),
        ),
      ],
    );
  }
}
