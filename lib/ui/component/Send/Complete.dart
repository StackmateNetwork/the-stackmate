import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';

class TransactionComplete extends StatelessWidget {
  const TransactionComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final txid = context.select((SendCubit sc) => sc.state.txId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 60),
        Text(
          'Transaction\nBroadcasted.',
          style: context.fonts.headline5!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Check your wallet history for details.',
          style: context.fonts.caption!.copyWith(
            color: context.colours.onBackground,
          ),
        ),
        const SizedBox(height: 60),
        TextButton(
          onPressed: () {
            context.read<SendCubit>().shareTxId();
          },
          child: const Text('Done.'),
        )
      ],
    );
  }
}
