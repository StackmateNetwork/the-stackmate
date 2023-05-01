import 'package:flutter/material.dart';
import 'package:sats/cubit/broadcast.dart';
import 'package:sats/pkg/extensions.dart';

class BroadcastPSBT extends StatelessWidget {
  const BroadcastPSBT({super.key});

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<BroadcastCubit, BroadcastState>(
      builder: (context, psbtState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Broadcast PSBT'.toUpperCase(),
              textAlign: TextAlign.center,
              style: context.fonts.labelSmall!.copyWith(
                color: context.colours.onBackground,
              ),
            ),
            const SizedBox(height: 26),
            if (psbtState.psbt == '')
              Text(
                'Paste a PSBT from your Clipboard or Import from File.',
                style: context.fonts.bodyMedium!.copyWith(
                  color: context.colours.onBackground,
                ),
              )
            else
              const Text('Got PSBT.'),
            const SizedBox(height: 16),
            SizedBox(
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: c.colours.primary, side: BorderSide(color: c.colours.onPrimary), disabledForegroundColor: c.colours.background.withOpacity(0.38).withOpacity(0.38),
                ),
                onPressed: () {
                  context.read<BroadcastCubit>().pastePSBT();
                },
                child: const Text('PASTE from Clipboard'),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: c.colours.primary, side: BorderSide(color: c.colours.onPrimary), disabledForegroundColor: c.colours.background.withOpacity(0.38).withOpacity(0.38),
                ),
                onPressed: () {
                  c.read<BroadcastCubit>().updatePSBTFile();
                },
                child: Text('Import psbt'.toUpperCase() + ''),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: c.colours.primary, side: BorderSide(color: c.colours.onPrimary), disabledForegroundColor: c.colours.background.withOpacity(0.38).withOpacity(0.38),
                ),
                onPressed: () {
                  c.read<BroadcastCubit>().verifyImportPSBT();
                },
                child: Text('verify psbt'.toUpperCase() + ''),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: c.colours.background, backgroundColor: c.colours.primary,
                ),
                onPressed: () {
                  context.read<BroadcastCubit>().broadcastConfirmed();
                },
                child: const Text('CONFIRM'),
              ),
            ),
            const SizedBox(height: 16),
            if (psbtState.txId != '')
              Text(
                psbtState.txId,
                textAlign: TextAlign.center,
                style: context.fonts.titleLarge!.copyWith(
                  color: context.colours.onBackground,
                ),
              )
            else
              Container(),
            if (psbtState.errBroadcasting != '')
              Text(
                psbtState.errBroadcasting,
                textAlign: TextAlign.center,
                style: context.fonts.bodySmall!.copyWith(
                  color: context.colours.error,
                ),
              )
            else
              Container(),
          ],
        );
      },
    );
  }
}
