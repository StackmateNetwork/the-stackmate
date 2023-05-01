import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/coldcard.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/validation.dart';

part 'xpub-import.freezed.dart';

const segwitNativePurpose = '84';
const invalidPubkeyError = 'Invalid Public Key.';
const invalidFingerprintError = 'Invalid Fingerprint.';
const invalidPathError = 'Invalid Derivation Path.';
const cameraError = 'Error while opening camera.';
const emptyString = '';

@freezed
class XpubImportState with _$XpubImportState {
  const factory XpubImportState({
    @Default('') String xpub,
    @Default('') String fingerPrint,
    @Default('') String path,
    @Default('') String errXpub,
    @Default('') String errFileImport,
    @Default(false) bool cameraOpened,
    @Default(false) bool detailsReady,
    @Default(false) bool clearJson,
    String? importedJSONPath,
    String? importedJSONfileName,
  }) = _SeedImportXpubState;
  const XpubImportState._();

  bool hasNoKeySource() {
    if (xpub.startsWith('[') && xpub.contains(']') && xpub.contains('/'))
      return false;
    return true;
  }
}

class XpubImportCubit extends Cubit<XpubImportState> {
  XpubImportCubit(
    // this._soloWalletAPI,
    this._logger,
    this._clipboard,
  ) : super(const XpubImportState());

  final IClipBoard _clipboard;
  // final ISoloWalletAPI _soloWalletAPI;
  final Logger _logger;

  Future<void> updateFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result != null) {
      final PlatformFile coldcardJson = result.files.single;

      emit(
        state.copyWith(
          importedJSONPath: coldcardJson.path,
          importedJSONfileName: coldcardJson.name,
        ),
      );
    } else {
      emit(state.copyWith(errFileImport: 'Error importing file'));
    }
  }

  Future<void> clearCachedFiles() async {
    final bool? result = await FilePicker.platform.clearTemporaryFiles();
    if (result != null) {
      emit(
        state.copyWith(
          clearJson: true,
          detailsReady: false,
          importedJSONfileName: emptyString,
        ),
      );
    } else {
      emit(state.copyWith(errFileImport: 'Error importing file'));
    }
  }

  void toggleCamera() async {
    try {
      emit(state.copyWith(cameraOpened: true, errXpub: emptyString));

      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        false,
        ScanMode.QR,
      );

      if (barcodeScanRes == '-1') barcodeScanRes = emptyString;

      emit(
        state.copyWith(
          xpub: Validation.formatHardenedPath(barcodeScanRes),
          cameraOpened: false,
        ),
      );
    } catch (e, s) {
      emit(state.copyWith(cameraOpened: false, errXpub: cameraError));

      _logger.logException(e, 'BtcSendAddressBloc._mapToggleCameraEvent', s);
    }
  }

  void xpubPasteClicked() async {
    final text = await _clipboard.pasteFromClipBoard();
    if (text.hasError) return;
    emit(
      state.copyWith(
        xpub: Validation.formatHardenedPath(text.result!),
        errXpub: emptyString,
      ),
    );
  }

  void xpubChanged(String text) {
    emit(
      state.copyWith(
        xpub: Validation.formatHardenedPath(text),
        errXpub: emptyString,
      ),
    );
  }

  void fingerPrintChanged(String text) {
    emit(state.copyWith(fingerPrint: text, errXpub: emptyString));
  }

  void fingerPrintPastedClicked() async {
    final text = await _clipboard.pasteFromClipBoard();
    if (text.hasError) return;
    emit(state.copyWith(fingerPrint: text.result!, errXpub: emptyString));
  }

  void pathChanged(String text) {
    emit(
      state.copyWith(
        path: Validation.formatHardenedPath(text),
        errXpub: emptyString,
      ),
    );
  }

  void pathPasteClicked() async {
    final text = await _clipboard.pasteFromClipBoard();
    if (text.hasError) return;

    emit(
      state.copyWith(
        path: Validation.formatHardenedPath(text.result!),
        errXpub: emptyString,
      ),
    );
  }

  void checkDetails() {
    if (state.xpub == emptyString || state.xpub.length < 64) {
      emit(
        state.copyWith(errXpub: invalidPubkeyError),
      );
      return;
    }
    if (state.hasNoKeySource() && state.fingerPrint.length < 8) {
      emit(
        state.copyWith(
          errXpub: invalidFingerprintError,
        ),
      );
      return;
    }
    if (state.hasNoKeySource() && state.path == emptyString) {
      emit(
        state.copyWith(
          errXpub: invalidPathError,
        ),
      );
      return;
    }

    emit(state.copyWith(detailsReady: true));
  }

  void clear() => emit(const XpubImportState());

  Future<void> importColdCardSegwit() async {
    try {
      final jsonFile = File(state.importedJSONPath!);
      final json = jsonDecode(await jsonFile.readAsString());
      final ColdCardGeneric ccWatcher =
          ColdCardGeneric.fromJson(json as Map<String, dynamic>);
      emit(
        state.copyWith(
          xpub: ccWatcher.bip84!.xpub!,
          fingerPrint: ccWatcher.xfp!.toLowerCase(),
          path: ccWatcher.bip84!.deriv!,
          detailsReady: true,
        ),
      );
    } catch (e, s) {
      emit(state.copyWith(detailsReady: false, errFileImport: e.toString()));
      _logger.logException(e, 'ColdCardJSON.ImportSegwit', s);
    }
  }
}
