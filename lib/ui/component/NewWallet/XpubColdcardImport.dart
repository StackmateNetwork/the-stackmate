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
    return BlocBuilder<XpubImportCubit, XpubImportState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IgnorePointer(
              ignoring: state.detailsReady,
              child: AnimatedOpacity(
                opacity: state.detailsReady ? 0.5 : 1,
                duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  height: 52,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: c.colours.onPrimary),
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
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {
                    c.read<XpubImportCubit>().clearCachedFiles();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor:
                            result ? c.colours.primary : c.colours.error,
                        content: Text(
                          result
                              ? 'Json file removed with success.'
                              : 'Failed to clear json file',
                        ),
                      ),
                    );
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
                onPressed: () {
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
