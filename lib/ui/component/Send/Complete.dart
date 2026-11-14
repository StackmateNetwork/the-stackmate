import 'package:material_ui/material_ui.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';

class TransactionComplete extends StatelessWidget {
  const TransactionComplete({super.key});

  @override
  Widget build(BuildContext context) {
    final txId = context.select((SendCubit w) => w.state.txId);
    final returnButton = SizedBox(
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: context.colours.surface,
          backgroundColor: context.colours.primary,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('RETURN'),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Transaction\nSuccessful.',
            style: context.fonts.headlineSmall!.copyWith(
              color: context.colours.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'TXID'.toUpperCase(),
            style: context.fonts.labelSmall!.copyWith(
              color: context.colours.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          SelectableText(
            txId,
            style: context.fonts.bodySmall!.copyWith(
              color: context.colours.onSurface,
            ),
          ),
          TextButton(
            onPressed: () => context.read<SendCubit>().shareTxId(),
            child: const Text('SHARE TXID'),
          ),
          const SizedBox(height: 32),
          const Icon(Icons.check_circle, size: 80),
          const SizedBox(height: 32),
          returnButton,
        ],
      ),
    );
  }
}
