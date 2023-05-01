import 'package:flutter/material.dart';
import 'package:sats/cubit/pin.dart';
import 'package:sats/pkg/extensions.dart';

class PinButton extends StatelessWidget {
  const PinButton({super.key});

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
                foregroundColor: context.colours.primary,
              ),
              onPressed: () async {
                // CHECK IF PIN IS VERIFIED
                context.read<PinCubit>().setChosenPin();
                // if (state.hasChosenPin) pinCubit.clearConfPin();
              },
              child: const Text('SET'),
            ),
          );
        else if (pinCubit.state.value == null && pinCubit.state.hasChosenPin)
          return SizedBox(
            height: 72,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: context.colours.background, backgroundColor: context.colours.primary,
              ),
              onPressed: () async {
                // CHECK IF PIN IS VERIFIED
                await pinCubit.checkConfirmedPin();
                // if (state.hasChosenPin) pinCubit.clearConfPin();
              },
              child: const Text('CONFIRM'),
            ),
          );
        else
          return SizedBox(
            height: 72,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: context.colours.background, backgroundColor: context.colours.primary,
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
