abstract class IClipBoard {
  Future<bool> copyToClipBoard(String tex);
  Future<String> pasteFromClipBoard();
}
