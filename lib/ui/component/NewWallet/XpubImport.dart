import 'package:flutter/material.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/common/ErrorHandler.dart';

class XpubFieldsImport extends StatefulWidget {
  const XpubFieldsImport({
    super.key,
  });

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
  void dispose() {
    _xpubController.dispose();
    _fingerPrintController.dispose();
    _pathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext c) {
    final state = c.select((XpubImportCubit x) => x.state);

    if (_xpubController.text != state.xpub) _xpubController.text = state.xpub;

    if (_fingerPrintController.text != state.fingerPrint)
      _fingerPrintController.text = state.fingerPrint;

    if (_pathController.text != state.path) _pathController.text = state.path;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        Text(
          'Public Key Details',
          style: c.fonts.headlineMedium!.copyWith(
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
            style: c.fonts.labelSmall!.copyWith(
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
            style: c.fonts.bodyLarge!.copyWith(
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
                style: c.fonts.labelLarge!.copyWith(color: c.colours.primary),
              ),
            ),
          ),
        ),
        const SizedBox(height: 36),
        SizedBox(
          height: 52,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: c.colours.primary,
              disabledForegroundColor:
                  c.colours.background.withOpacity(0.38).withOpacity(0.38),
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
            style: c.fonts.bodySmall!.copyWith(color: c.colours.error),
          ),
        SizedBox(
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: c.colours.background,
              backgroundColor: c.colours.primary,
            ),
            onPressed: () async {
              c.read<XpubImportCubit>().checkDetails();
              if (state.errXpub != '') {
                handleError(context, 'Invalid pub key');
              }
            },
            child: const Text('CONFIRM'),
          ),
        ),
      ],
    );
  }
}
