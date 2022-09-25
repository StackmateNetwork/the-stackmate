import 'package:flutter/material.dart';
import 'package:sats/cubit/preferences.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/BitcoinDisplayMedium.dart';

class ConfirmTransaction extends StatelessWidget {
  const ConfirmTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((SendCubit sc) => sc.state);
    final wallet = context.select((WalletsCubit w) => w.state.selectedWallet!);
    final preferences = context.select((PreferencesCubit p) => p.state);

    if (state.finalAmount == null) return Container();
    return IgnorePointer(
      ignoring: state.sendingTx,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: state.sendingTx ? 0.5 : 1,
        child: Padding(
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
                state.address,
                style: context.fonts.caption!.copyWith(
                  color: context.colours.onBackground,
                ),
              ),
              const SizedBox(height: 60),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 17.0),
                    child: Text(
                      'Amount'.toUpperCase(),
                      style: context.fonts.overline!.copyWith(
                        color: context.colours.onBackground,
                      ),
                    ),
                  ),
                  const Spacer(),
                  BitcoinDisplayMedium(
                    satsAmount: state.finalAmount.toString(),
                    bitcoinUnit: preferences.preferredBitcoinUnit,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 17.0),
                    child: Text(
                      'Network Fee'.toUpperCase(),
                      style: context.fonts.overline!.copyWith(
                        color: context.colours.onBackground,
                      ),
                    ),
                  ),
                  const Spacer(),
                  BitcoinDisplayMedium(
                    satsAmount: state.finalFee.toString(),
                    bitcoinUnit: preferences.preferredBitcoinUnit,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 17.0),
                    child: Text(
                      'Total'.toUpperCase(),
                      style: context.fonts.overline!.copyWith(
                        color: context.colours.onBackground,
                      ),
                    ),
                  ),
                  const Spacer(),
                  BitcoinDisplayMedium(
                    satsAmount: state.total().toString(),
                    bitcoinUnit: preferences.preferredBitcoinUnit,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              if (wallet.isNotWatchOnly())
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: context.colours.background,
                      backgroundColor: context.colours.primary,
                    ),
                    onPressed: () {
                      context.read<SendCubit>().sendClicked();
                    },
                    child: const Text('SEND'),
                  ),
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
                  onPressed: () async {
                    await context.read<SendCubit>().savePSBTToFile();
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
        ),
      ),
    );
  }
}
