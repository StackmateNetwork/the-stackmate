import 'package:flutter/services.dart' show rootBundle;
import 'package:sats/model/result.dart';

/// The BIP39 English word list bundled with the app.
class MnemonicWords {
  static const _asset = 'assets/bip39_english.txt';
  static const wordCount = 2048;

  Future<R<List<String>>> loadWordList() async {
    try {
      final raw = await rootBundle.loadString(_asset);
      final words = raw
          .split('\n')
          .map((w) => w.trim())
          .where((w) => w.isNotEmpty)
          .toList();
      if (words.length != wordCount) {
        return R(error: 'Corrupt word list: ${words.length} words.');
      }
      return R(result: words);
    } catch (e) {
      return R(error: e.toString());
    }
  }
}
