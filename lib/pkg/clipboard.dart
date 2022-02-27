import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:oktoast/oktoast.dart';

abstract class IClipBoard {
  Future<bool> copyToClipBoard(String tex);
  Future<String> pasteFromClipBoard();
}

class ClipBoardd implements IClipBoard {
  @override
  Future<bool> copyToClipBoard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    showToast('COPIED');
    return true;
  }

  @override
  Future<String> pasteFromClipBoard() async {
    final data = await Clipboard.getData('text/plain');
    if (data == null || data.text == null) {
      return '';
    }
    return data.text!;
  }
}

class DummyClipBoard implements IClipBoard {
  @override
  Future<bool> copyToClipBoard(String text) async {
    return true;
  }

  @override
  Future<String> pasteFromClipBoard() async {
    return '';
  }
}
