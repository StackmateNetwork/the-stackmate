import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';
import 'package:sats/ui/component/common/SuccessHandler.dart';

class XpubColdcardImport extends StatelessWidget {
  const XpubColdcardImport({
    super.key,
  });
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
              style: context.fonts.titleLarge!.copyWith(
                color: context.colours.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Once you have your account loaded in your ColdCard (APPLY passphrase if required), navigate to:\n\n-> Advanced\n-> Micro SD Card\n-> Export Wallet\n-> Generic JSON\n\n\nImport this JSON via an SD Adaptor.\n\nWe only derive the Segwit account from your ColdCard. Ask us if you need support for Legacy.',
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
                      foregroundColor: c.colours.primary,
                      side: BorderSide(color: c.colours.onPrimary),
                      disabledForegroundColor: c.colours.background
                          .withOpacity(0.38)
                          .withOpacity(0.38),
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
                    style: c.fonts.labelLarge!
                        .copyWith(color: c.colours.secondary),
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
                    foregroundColor: c.colours.primary,
                    side: BorderSide(color: c.colours.onPrimary),
                    disabledForegroundColor: c.colours.background
                        .withOpacity(0.38)
                        .withOpacity(0.38),
                  ),
                  onPressed: () async {
                    c.read<XpubImportCubit>().clearCachedFiles();
                    result
                        ? handleSuccess(context, 'Success cleared')
                        : handleError(context, 'Error delete file');
                  },
                  child: Text(
                    'Clear Json',
                    style:
                        c.fonts.labelLarge!.copyWith(color: c.colours.primary),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (state.errFileImport != '')
              Text(
                state.errFileImport,
                style: c.fonts.bodySmall!.copyWith(color: c.colours.error),
              ),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: c.colours.background,
                  backgroundColor: c.colours.primary,
                ),
                onPressed: () {
                  c.read<XpubImportCubit>().importColdCardSegwit();
                  if (state.errFileImport != '')
                    handleError(context, 'Error reading file');
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
