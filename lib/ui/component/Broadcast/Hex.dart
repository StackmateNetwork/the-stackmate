import 'package:flutter/material.dart';
import 'package:sats/cubit/broadcast.dart';
import 'package:sats/pkg/extensions.dart';

class BroadcastHex extends StatefulWidget {
  const BroadcastHex({Key? key}) : super(key: key);

  @override
  State<BroadcastHex> createState() => _BroadcastHexState();
}

class _BroadcastHexState extends State<BroadcastHex> {
  @override
  Widget build(BuildContext c) {
    final hex = context.select((BroadcastCubit sc) => sc.state.hex);
    TextEditingController textController = TextEditingController(text: hex);
    return BlocBuilder<BroadcastCubit, BroadcastState>(
      builder: (context, broadcastState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Broadcast Hex'.toUpperCase(),
              textAlign: TextAlign.center,
              style: context.fonts.overline!.copyWith(
                color: context.colours.onBackground,
              ),
            ),
            const SizedBox(height: 26),
            SizedBox(
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: context.colours.onPrimary),
                  primary: context.colours.primary,
                  onSurface: context.colours.background,
                ),
                onPressed: () {
                  context.read<BroadcastCubit>().pasteHex();
                },
                child: const Text('PASTE from Clipboard'),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: context.colours.onPrimary),
                  primary: context.colours.primary,
                  onSurface: context.colours.background,
                ),
                onPressed: () {
                  context.read<BroadcastCubit>().updateHexFile();
                },
                child: Text('Import hex'.toUpperCase()),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: context.colours.onPrimary),
                  primary: context.colours.primary,
                  onSurface: context.colours.background,
                ),
                onPressed: () {
                  context.read<BroadcastCubit>().verifyImportHex();
                },
                child: Text('verify hex'.toUpperCase()),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.zero,
              child: TextField(
                controller: textController,
                enableIMEPersonalizedLearning: false,
                style: c.fonts.headline6!.copyWith(color: c.colours.onPrimary),
                enableSuggestions: false,
                keyboardType: TextInputType.text,
                autocorrect: false,
                onChanged: (text) {
                  c.read<BroadcastCubit>().hexText(text);
                },
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'hex',
                  fillColor: c.colours.surface,
                  //errorText: state.seedError.nullIfEmpty(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: context.colours.primary,
                  onPrimary: context.colours.background,
                ),
                onPressed: () {
                  context.read<BroadcastCubit>().broadcastHexConfirmed();
                },
                child: const Text('CONFIRM'),
              ),
            ),
            const SizedBox(height: 16),
            if (broadcastState.txId != '')
              Text(
                broadcastState.txId,
                textAlign: TextAlign.center,
                style: context.fonts.headline6!.copyWith(
                  color: context.colours.onBackground,
                ),
              )
            else
              Container(),
            if (broadcastState.errBroadcasting != '')
              Text(
                broadcastState.errBroadcasting,
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
