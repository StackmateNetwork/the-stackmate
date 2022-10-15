import 'package:flutter/material.dart';
import 'package:sats/cubit/broadcast.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
                  primary: c.colours.primary,
                  side: BorderSide(color: c.colours.onPrimary),
                  onSurface: c.colours.background.withOpacity(0.38),
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
                  primary: context.colours.primary,
                  side: BorderSide(color: context.colours.onPrimary),
                  onSurface: context.colours.background.withOpacity(0.38),
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
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: c.colours.primary,
                    side: BorderSide(color: c.colours.onPrimary),
                    onSurface: c.colours.background.withOpacity(0.38),
                  ),
                  onPressed: () async {
                    c.read<BroadcastCubit>().clearCachedFiles();
                    result
                        ? showTopSnackBar(
                            context,
                            const CustomSnackBar.success(
                              message: 'Delete successfully',
                            ),
                          )
                        : showTopSnackBar(
                            context,
                            const CustomSnackBar.error(
                              message: 'Error deleting file',
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
                  primary: context.colours.primary,
                  side: BorderSide(color: context.colours.onPrimary),
                  onSurface: context.colours.background.withOpacity(0.38),
                ),
                onPressed: () async {
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
                keyboardType: TextInputType.none,
                autocorrect: false,
                onChanged: (text) {
                  c.read<BroadcastCubit>().hexText(text);
                },
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: 'Transaction Hex / PSBT',
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
                  onPrimary: context.colours.background,
                  primary: context.colours.primary,
                ),
                onPressed: () async {
                  context.read<BroadcastCubit>().broadcastHexConfirmed();
                  if (broadcastState.errBroadcasting != '') {
                    showTopSnackBar(
                      context,
                      const CustomSnackBar.error(
                        message: 'Error detecting valid hex',
                      ),
                    );
                  }
                },
                child: Text('Broadcast'.toUpperCase()),
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
