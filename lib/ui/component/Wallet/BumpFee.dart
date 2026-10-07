import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallet/bump-fee.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/cubit/wallet/signer.dart';
import 'package:sats/model/transaction.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/extensions.dart';

/// Opens the replace-by-fee sheet for an unconfirmed outgoing [transaction].
Future<void> showBumpFeeSheet(BuildContext c, Transaction transaction) {
  final info = c.read<InfoCubit>();
  final cubit = BumpFeeCubit(
    transaction,
    info,
    WalletSigner(
      locator<IStackMateBitcoin>(),
      c.read<MasterKeyCubit>(),
      c.read<ChainSelectCubit>(),
    ),
    c.read<NodeAddressCubit>(),
    c.read<TorCubit>(),
    c.read<Logger>(),
    suggestedFeeRate: c.read<FeesCubit>().getFees().fast,
  );

  return showModalBottomSheet<void>(
    context: c,
    isScrollControlled: true,
    backgroundColor: c.colours.surface,
    builder: (_) => BlocProvider.value(
      value: cubit,
      child: _BumpFeeSheet(transaction: transaction),
    ),
  ).whenComplete(cubit.close);
}

class _BumpFeeSheet extends StatelessWidget {
  const _BumpFeeSheet({required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext c) {
    final state = c.select((BumpFeeCubit b) => b.state);

    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(c).viewInsets.bottom + 32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'BUMP FEE'.notLocalised(),
            style: c.fonts.titleLarge!.copyWith(color: c.colours.onSurface),
          ),
          const SizedBox(height: 8),
          Text(
            'Replace this unconfirmed transaction with one paying a higher '
                    'fee so it confirms faster. The recipient and amount stay '
                    'the same; the extra fee comes out of your change.'
                .notLocalised(),
            style: c.fonts.bodySmall!.copyWith(color: c.colours.onSurface),
          ),
          const SizedBox(height: 16),
          Text(
            'CURRENT FEE'.notLocalised(),
            style: c.fonts.labelSmall!.copyWith(color: c.colours.onSurface),
          ),
          Text(
            '${transaction.fee} sats',
            style: c.fonts.bodyMedium!.copyWith(color: c.colours.onSurface),
          ),
          const SizedBox(height: 16),
          if (state.done) ...[
            Text(
              'NEW TRANSACTION ID'.notLocalised(),
              style: c.fonts.labelSmall!.copyWith(color: c.colours.onSurface),
            ),
            SelectableText(
              state.newTxid,
              style: c.fonts.bodySmall!.copyWith(color: c.colours.primary),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(c),
              child: Text('DONE'.notLocalised()),
            ),
          ] else ...[
            TextFormField(
              initialValue: state.feeRate,
              enabled: !state.bumping,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
              ],
              onChanged: c.read<BumpFeeCubit>().feeRateChanged,
              style: c.fonts.bodyLarge!.copyWith(color: c.colours.onSurface),
              decoration: const InputDecoration(
                labelText: 'New fee rate',
                suffixText: 'sats/vB',
              ),
            ),
            if (state.error.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                state.error,
                style: c.fonts.bodySmall!.copyWith(color: c.colours.error),
              ),
            ],
            const SizedBox(height: 24),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: c.colours.surface,
                  backgroundColor: c.colours.primary,
                ),
                onPressed:
                    state.bumping ? null : c.read<BumpFeeCubit>().bump,
                child: state.bumping
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text('BUMP & BROADCAST'.notLocalised()),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
