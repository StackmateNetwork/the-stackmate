import 'package:flutter/material.dart';
import 'package:sats/cubit/wallet/send.dart';
import 'package:sats/pkg/extensions.dart';

class SelectFee extends StatelessWidget {
  const SelectFee({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((SendCubit sc) => sc.state);
    final finalFee = state.finalFee;
    if (state.feeSlow == null ||
        state.feeMedium == null ||
        state.feeFast == null ||
        finalFee == null) {
      return Container();
    }

    final slow = state.feeSlow!.toString();
    final medium = state.feeMedium!.toString();
    final fast = state.feeFast!.toString();

    final min = state.feeSlow!.toDouble();
    final max = (state.feeFast! + 250).toDouble();

    return IgnorePointer(
      ignoring: state.isBusy,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: state.isBusy ? 0.3 : 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Opacity(
                      opacity: state.feesOption == 0 ? 1 : 0.6,
                      child: TextButton(
                        onPressed: () {
                          context.read<SendCubit>().feeSelected(0);
                        },
                        child: Text('slow'.toUpperCase()),
                      ),
                    ),
                    Text(
                      '~ 2 - 3 hours\n($slow sats)',
                      textAlign: TextAlign.center,
                      style: context.fonts.bodySmall!.copyWith(
                        fontSize: 10,
                        color: context.colours.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Opacity(
                      opacity: state.feesOption == 1 ? 1 : 0.6,
                      child: TextButton(
                        onPressed: () {
                          context.read<SendCubit>().feeSelected(1);
                        },
                        child: Text('medium'.toUpperCase()),
                      ),
                    ),
                    Text(
                      '~ 60 - 90 minutes \n($medium sats)',
                      textAlign: TextAlign.center,
                      style: context.fonts.bodySmall!.copyWith(
                        fontSize: 10,
                        color: context.colours.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Opacity(
                      opacity: state.feesOption == 2 ? 1 : 0.6,
                      child: TextButton(
                        onPressed: () {
                          context.read<SendCubit>().feeSelected(2);
                        },
                        child: Text('Fast'.toUpperCase()),
                      ),
                    ),
                    Text(
                      '~ 20 minutes\n($fast sats)',
                      textAlign: TextAlign.center,
                      style: context.fonts.bodySmall!.copyWith(
                        fontSize: 10,
                        color: context.colours.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Slider(
              divisions: 6,
              min: min,
              max: max,
              value: finalFee.toDouble().clamp(min, max),
              onChanged: (f) {
                context.read<SendCubit>().feeChanged(f.round());
              },
            ),
            const SizedBox(height: 60),
            if (state.finalFee != null) ...[
              Text(
                'FINAL FEES',
                style: context.fonts.labelSmall!.copyWith(
                  color: context.colours.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${state.finalFee} sats',
                style: context.fonts.titleMedium!.copyWith(
                  color: context.colours.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${state.finalFee!.toBtc()} BTC',
                style: context.fonts.bodySmall!.copyWith(
                  color: context.colours.onSurface,
                ),
              ),
            ],
            const SizedBox(height: 80),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: context.colours.surface,
                  backgroundColor: context.colours.primary,
                ),
                onPressed: () {
                  context.read<SendCubit>().feeConfirmedClicked();
                },
                child: const Text('CONFIRM'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
