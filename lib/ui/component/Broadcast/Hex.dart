import 'package:flutter/material.dart';
import 'package:sats/cubit/broadcast.dart';
import 'package:sats/pkg/extensions.dart';

class BroadcastHex extends StatelessWidget {
  const BroadcastHex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final hex = c.select((BroadcastCubit sc) => sc.state.hex);
    final result = c.select((BroadcastCubit sc) => sc.state.clearData);
    final name = c.select((BroadcastCubit sn) => sn.state.importedHexfileName);
    final TextEditingController textController =
        TextEditingController(text: hex);
    return BlocBuilder<BroadcastCubit, BroadcastState>(
      builder: (context, broadcastState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                child: Text('Import Signed file'.toUpperCase()),
              ),
            ),
            const SizedBox(height: 10),
            if (broadcastState.importedHexfileName != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'File: ' +
                        ((name.toString() == '')
                            ? 'None Selected'
                            : name.toString()),
                    style: c.fonts.button!.copyWith(color: c.colours.secondary),
                  ),
                ),
              ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {
                    c.read<BroadcastCubit>().clearCachedFiles();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor:
                            result ? c.colours.primary : c.colours.error,
                        content: Text(
                          result ? ' File removed' : 'Failed to clear file',
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Clear file',
                    style: c.fonts.button!.copyWith(color: c.colours.primary),
                  ),
                ),
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
                child: Text('verify file'.toUpperCase()),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.zero,
              child: TextField(
                controller: textController,
                enableIMEPersonalizedLearning: false,
                style: c.fonts.bodySmall!.copyWith(color: c.colours.onPrimary),
                enableSuggestions: false,
                keyboardType: TextInputType.text,
                autocorrect: false,
                onChanged: (text) {
                  c.read<BroadcastCubit>().hexText(text);
                },
                maxLines: 8,
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
                child: const Text('Broadcast'),
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
