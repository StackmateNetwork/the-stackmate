import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/pkg/extensions.dart';

class PinButton extends StatelessWidget {
  const PinButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pinCubit = context.select((PinCubit pc) => pc);
    return BlocBuilder<PinCubit, PinState>(
      buildWhen: (previous, current) =>
          previous.hasChosenPin != current.hasChosenPin,
      builder: (context, state) {
        if (pinCubit.state.value == null && !pinCubit.state.hasChosenPin)
          return SizedBox(
            height: 72,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: context.colours.primary,
              ),
              onPressed: () async {
                // CHECK IF PIN IS VERIFIED
                context.read<PinCubit>().setChosenPin();
              },
              child: const Text('SET'),
            ),
          );
        else if (pinCubit.state.value == null && pinCubit.state.hasChosenPin)
          return SizedBox(
            height: 72,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: context.colours.background,
                primary: context.colours.primary,
              ),
              onPressed: () async {
                // CHECK IF PIN IS VERIFIED
                await pinCubit.checkConfirmedPin();
              },
              child: const Text('CONFIRM'),
            ),
          );
        else
          return SizedBox(
            height: 72,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: context.colours.background,
                primary: context.colours.primary,
              ),
              onPressed: () async {
                // CHECK IF PIN IS VERIFIED
                await pinCubit.checkEnterPin();
              },
              child: const Text('START'),
            ),
          );
      },
    );
  }
}
