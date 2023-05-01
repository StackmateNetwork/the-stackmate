import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';

class TransactionComplete extends StatelessWidget {
  const TransactionComplete({super.key});

  @override
  Widget build(BuildContext context) {
    final wallet = context.select((SendCubit w) => w.state.wallet);
    if (wallet.isNotWatchOnly())
      return Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Transaction\nSuccessful.',
              style: context.fonts.headlineSmall!.copyWith(
                color: context.colours.onBackground,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Open your wallet to update your balance and history.',
              style: context.fonts.bodySmall!.copyWith(
                color: context.colours.onBackground,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            const Icon(Icons.check_circle, size: 80),
            const SizedBox(height: 32),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: context.colours.background,
                  backgroundColor: context.colours.primary,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('RETURN'),
              ),
            )
          ],
        ),
      );
    else
      return Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'PSBT\nBuild Complete.',
              style: context.fonts.headlineSmall!.copyWith(
                color: context.colours.onBackground,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Pass it to a signing device.',
              style: context.fonts.bodySmall!.copyWith(
                color: context.colours.onBackground,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
  }
}
