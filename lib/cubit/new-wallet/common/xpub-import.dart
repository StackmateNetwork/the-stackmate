import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/pkg/interface/clipboard.dart';

part 'xpub-import.freezed.dart';

@freezed
class XpubImportState with _$XpubImportState {
  const factory XpubImportState({
    @Default('') String xpub,
    @Default('') String fingerPrint,
    @Default('') String path,
    @Default('') String errXpub,
    @Default(false) bool cameraOpened,
    @Default(false) bool detailsReady,
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
  static const segwitNativePurpose = '84';
  static const invalidPubkeyError = 'Invalid Public Key.';
  static const invalidFingerprintError = 'Invalid Fingerprint.';
  static const invalidPathError = 'Invalid Derivation Path.';
  static const cameraError = 'Error while opening camera.';
  static const emptyString = '';

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

      emit(state.copyWith(xpub: barcodeScanRes, cameraOpened: false));
    } catch (e, s) {
      emit(state.copyWith(cameraOpened: false, errXpub: cameraError));

      _logger.logException(e, 'BtcSendAddressBloc._mapToggleCameraEvent', s);
    }
  }

  void xpubPasteClicked() async {
    final text = await _clipboard.pasteFromClipBoard();
    if (text.hasError) return;
    emit(state.copyWith(xpub: text.result!, errXpub: emptyString));
  }

  void xpubChanged(String text) {
    emit(state.copyWith(xpub: text, errXpub: emptyString));
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
    emit(state.copyWith(path: text, errXpub: emptyString));
  }

  void pathPasteClicked() async {
    final text = await _clipboard.pasteFromClipBoard();
    if (text.hasError) return;

    emit(state.copyWith(path: text.result!, errXpub: emptyString));
  }

  void checkDetails() {
    if (state.xpub == emptyString || state.xpub.length < 10) {
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
}
