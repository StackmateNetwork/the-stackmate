import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';

class ConfirmTransaction extends StatelessWidget {
  const ConfirmTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((SendCubit sc) => sc.state);

    if (state.finalAmount == null) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // const SizedBox(height: 24),
        Text(
          'Confirm\nTransaction',
          style: context.fonts.headline5!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          'Address'.toUpperCase(),
          style: context.fonts.overline!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '' + state.address,
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 60),
        Text(
          'Amount'.toUpperCase(),
          style: context.fonts.overline!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '' + state.finalAmount.toString() + ' sats',
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '' + state.finalAmount.toBtc() + ' BTC',
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 60),
        Text(
          'Network Fee'.toUpperCase(),
          style: context.fonts.overline!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '' + state.finalFee.toString() + ' sats',
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 60),
        Text(
          'Total'.toUpperCase(),
          style: context.fonts.overline!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '' + state.total().toString() + ' sats',
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '' + state.total().toBtc() + ' BTC',
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 60),
        TextButton(
          onPressed: () {
            context.read<SendCubit>().sendClicked();
          },
          child: const Text('SEND'),
        )
      ],
    );
  }
}
