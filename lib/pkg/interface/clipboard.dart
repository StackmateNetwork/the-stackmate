import 'package:sats/model/result.dart';

abstract class IClipBoard {
  Future<R<bool>> copyToClipBoard(String tex);
  Future<R<String>> pasteFromClipBoard();
}
