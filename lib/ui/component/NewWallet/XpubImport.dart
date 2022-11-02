import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class XpubFieldsImport extends StatefulWidget {
  const XpubFieldsImport({
    Key? key,
  }) : super(key: key);

  @override
  _XpubImportFieldsState createState() => _XpubImportFieldsState();
}

class _XpubImportFieldsState extends State<XpubFieldsImport> {
  late TextEditingController _xpubController;
  late TextEditingController _fingerPrintController;
  late TextEditingController _pathController;

  @override
  void initState() {
    _xpubController = TextEditingController();
    _fingerPrintController = TextEditingController();
    _pathController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    return BlocBuilder<XpubImportCubit, XpubImportState>(
      builder: (context, state) {
        if (_xpubController.text != state.xpub)
          _xpubController.text = state.xpub;

        if (_fingerPrintController.text != state.fingerPrint)
          _fingerPrintController.text = state.fingerPrint;

        if (_pathController.text != state.path)
          _pathController.text = state.path;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Text(
              'Public Key Details',
              style: c.fonts.headline4!.copyWith(
                color: c.colours.onPrimary,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Text(
                'Extended Public Key'.toUpperCase().notLocalised(),
                style: c.fonts.overline!.copyWith(
                  color: c.colours.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: TextField(
                controller: _xpubController,
                maxLines: 4,
                style: c.fonts.bodyText1!.copyWith(
                  color: c.colours.onBackground,
                ),
                onChanged: (text) {
                  c.read<XpubImportCubit>().xpubChanged(text);
                },
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    c.read<XpubImportCubit>().xpubPasteClicked();
                  },
                  child: Text(
                    'PASTE'.notLocalised(),
                    style: c.fonts.button!.copyWith(color: c.colours.primary),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),
            SizedBox(
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: c.colours.primary,
                  onSurface: c.colours.background.withOpacity(0.38),
                ),
                onPressed: () {
                  c.read<XpubImportCubit>().toggleCamera();
                },
                child: Text('SCAN'.toUpperCase()),
              ),
            ),
            const SizedBox(height: 36),
            if (state.errXpub != '')
              Text(
                state.errXpub,
                style: c.fonts.caption!.copyWith(color: c.colours.error),
              ),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: c.colours.background,
                  primary: c.colours.primary,
                ),
                onPressed: () async {
                  c.read<XpubImportCubit>().checkDetails();
                  if (state.errXpub != '') {
                    showTopSnackBar(
                      context,
                      const CustomSnackBar.error(
                        message: '',
                      ),
                    );
                  }
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
