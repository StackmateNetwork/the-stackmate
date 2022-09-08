import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/pkg/extensions.dart';

class XpubColdcardImport extends StatelessWidget {
  const XpubColdcardImport({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext c) {
    final result = c.select((XpubImportCubit sc) => sc.state.clearJson);
    final name =
        c.select((XpubImportCubit sn) => sn.state.importedJSONfileName);
    return BlocBuilder<XpubImportCubit, XpubImportState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Text(
              'Generic.json'.toUpperCase(),
              style: context.fonts.headline6!.copyWith(
                color: context.colours.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              "Once you have your account loaded in your ColdCard (APPLY passphrase if required), navigate to:\n\n-> Advanced\n-> Micro SD Card\n-> Export Wallet\n-> Generic JSON\n-> Account 0\n\nThis will dump your ColdCard account's public keys into a .json file.\nImport the JSON file here.\n\nWE RECOMMEND USING AN SD ADAPTOR, AND AVOID STORING YOUR PUBLIC KEYS ON YOUR PHONE'S SHARED MEMORY.\n\nWe only derive the Segwit account from your ColdCard. Ask us if you need support for Legacy.",
              style: context.fonts.bodySmall!.copyWith(
                color: context.colours.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            IgnorePointer(
              ignoring: state.detailsReady,
              child: AnimatedOpacity(
                opacity: state.detailsReady ? 0.5 : 1,
                duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  height: 52,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: c.colours.onPrimary),
                      primary: c.colours.primary,
                      onSurface: c.colours.background,
                    ),
                    onPressed: () {
                      c.read<XpubImportCubit>().updateFile();
                    },
                    child: Text('Import json file'.toUpperCase() + ''),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (state.importedJSONfileName != null)
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
                    side: BorderSide(color: c.colours.onPrimary),
                    primary: c.colours.primary,
                    onSurface: c.colours.background,
                  ),
                  onPressed: () async {
                    c.read<XpubImportCubit>().clearCachedFiles();
                    final snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: '',
                        message: result
                            ? 'Deleted json file'
                            : 'Failed to delete json file',
                        contentType:
                            result ? ContentType.success : ContentType.warning,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text(
                    'Clear Json',
                    style: c.fonts.button!.copyWith(color: c.colours.primary),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (state.errFileImport != '')
              Text(
                state.errFileImport,
                style: c.fonts.caption!.copyWith(color: c.colours.error),
              ),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: c.colours.primary,
                  onPrimary: c.colours.background,
                ),
                onPressed: () async {
                  c.read<XpubImportCubit>().importColdCardSegwit();
                },
                child: const Text('CONFIRM'),
              ),
            ),
          ],
        );
      },
    );
  }
}
