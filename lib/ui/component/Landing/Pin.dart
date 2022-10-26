import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/pkg/extensions.dart';

class PIN extends StatelessWidget {
  const PIN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pinCubit = context.select((PinCubit pc) => pc.state);

    return BlocListener<PinCubit, PinState>(
      listener: (context, state) => {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _MainPart(),
        ],
      ),
    );
  }
}

class _MainPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pinCubit = context.select((PinCubit pc) => pc);
    final masterKey = context.select((MasterKeyCubit mc) => mc.state.key);
    return BlocBuilder<PinCubit, PinState>(
      buildWhen: (previous, current) =>
          previous.chosenValue != current.chosenValue ||
          previous.confirmedValue != current.confirmedValue,
      builder: (context, state) {
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
            if (pinCubit.state.value != null &&
                pinCubit.state.chosenValue == '')
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
            if (pinCubit.state.value != null &&
                pinCubit.state.chosenValue != '')
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
                      if (masterKey != null) {
                        context.push('/home');
                      }
                      if (masterKey == null) {
                        context.push('/add-wallet');
                      }
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
      },
    );
  }
}
