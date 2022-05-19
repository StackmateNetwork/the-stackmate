import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';

class ConfirmTransaction extends StatelessWidget {
  const ConfirmTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((SendCubit sc) => sc.state);
    final wallet = context.select((WalletsCubit w) => w.state.selectedWallet!);

    if (state.finalAmount == null) return Container();
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12),
          Text(
            'Transaction\nDetails',
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
          Row(
            children: [
              Text(
                'Amount'.toUpperCase(),
                style: context.fonts.overline!.copyWith(
                  color: context.colours.onBackground,
                ),
              ),
              const Spacer(),
              Text(
                NumberFormat('###,000').format(
                      double.parse(state.finalAmount.toString()),
                    ) +
                    ' sats',
                style: context.fonts.caption!.copyWith(
                  color: context.colours.onBackground,
                  fontSize: 21,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            '' + state.finalAmount.toBtc() + ' BTC',
            style: context.fonts.caption!.copyWith(
              color: context.colours.onBackground.withOpacity(0.7),
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Network Fee'.toUpperCase(),
                style: context.fonts.overline!.copyWith(
                  color: context.colours.onBackground,
                ),
              ),
              const Spacer(),
              Text(
                NumberFormat('###,000')
                        .format(double.parse(state.finalFee.toString())) +
                    ' sats',
                style: context.fonts.caption!.copyWith(
                  color: context.colours.onBackground,
                  fontSize: 21,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '' + state.finalFee.toBtc() + ' BTC',
            style: context.fonts.caption!.copyWith(
              color: context.colours.onBackground.withOpacity(0.7),
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Total'.toUpperCase(),
                style: context.fonts.overline!.copyWith(
                  color: context.colours.onBackground,
                ),
              ),
              const Spacer(),
              Text(
                NumberFormat('###,000')
                        .format(double.parse(state.total().toString())) +
                    ' sats',
                style: context.fonts.caption!.copyWith(
                  color: context.colours.onBackground,
                  fontSize: 21,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            '' + state.total().toBtc() + ' BTC',
            style: context.fonts.caption!.copyWith(
              color: context.colours.onBackground.withOpacity(0.7),
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 60),
          if (wallet.isNotWatchOnly())
            TextButton(
              onPressed: () {
                context.read<SendCubit>().sendClicked();
              },
              child: const Text('SEND'),
            )
          else ...[
            TextButton(
              onPressed: () {
                context.read<SendCubit>().copyPSBT();
                // Future.delayed(Duration(seconds: 2));
              },
              child: const Text('COPY PSBT'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                // context.read<SendCubit>().savePSBTToFile(context);
                // Future.delayed(Duration(seconds: 2));
              },
              child: const Text('SAVE PSBT'),
            )
          ],
          const SizedBox(height: 6),
          if (state.errSending != '')
            Text(
              state.errSending,
              style: context.fonts.caption!.copyWith(
                color: context.colours.error.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
