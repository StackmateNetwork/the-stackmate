import 'package:flutter/material.dart';
import 'package:sats/cubit/psbt-tool.dart';
import 'package:sats/pkg/extensions.dart';

class BroadcastPSBT extends StatelessWidget {
  const BroadcastPSBT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<PSBTCubit, PSBTState>(
      builder: (context, psbtState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'PSBT To Broadcast'.toUpperCase(),
              textAlign: TextAlign.center,
              style: context.fonts.overline!.copyWith(
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
                  side: BorderSide(color: c.colours.onPrimary),
                  primary: c.colours.primary,
                  onSurface: c.colours.background,
                ),
                onPressed: () {
                  context.read<PSBTCubit>().pastePSBT();
                },
                child: const Text('PASTE from Clipboard'),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: c.colours.onPrimary),
                  primary: c.colours.primary,
                  onSurface: c.colours.background,
                ),
                onPressed: () {
                  c.read<PSBTCubit>().updateFile();
                },
                child: Text('Import psbt'.toUpperCase() + ''),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: c.colours.onPrimary),
                  primary: c.colours.primary,
                  onSurface: c.colours.background,
                ),
                onPressed: () {
                  c.read<PSBTCubit>().verifyImportPSBT();
                },
                child: Text('verify psbt'.toUpperCase() + ''),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: c.colours.primary,
                  onPrimary: c.colours.background,
                ),
                onPressed: () {
                  context.read<PSBTCubit>().broadcastConfirmed();
                },
                child: const Text('CONFIRM'),
              ),
            ),
            const SizedBox(height: 16),
            if (psbtState.txId != '')
              Text(
                psbtState.txId,
                textAlign: TextAlign.center,
                style: context.fonts.headline6!.copyWith(
                  color: context.colours.onBackground,
                ),
              )
            else
              Container(),
            if (psbtState.errBroadcasting != '')
              Text(
                psbtState.errBroadcasting,
                textAlign: TextAlign.center,
                style: context.fonts.caption!.copyWith(
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
