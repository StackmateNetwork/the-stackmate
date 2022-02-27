import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';

class TransactionComplete extends StatelessWidget {
  const TransactionComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txid = context.select((SendCubit sc) => sc.state.txId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 60),
        Text(
          'Confirm\nTransaction',
          style: context.fonts.headline5!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          'Transaction ID'.toUpperCase(),
          style: context.fonts.overline!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '' + txid,
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 60),
        TextButton(
          onPressed: () {
            context.read<SendCubit>().shareTxId();
          },
          child: const Text('SHARE TRANSACTION ID'),
        )
      ],
    );
  }
}
