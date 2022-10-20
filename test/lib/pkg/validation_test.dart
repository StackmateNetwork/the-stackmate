import 'package:flutter_test/flutter_test.dart';
import 'package:sats/pkg/validation.dart';

void main() {
  setUp(() async {});

  test('extracts fingerprint from an xkey string', () async {
    const xkey =
        '[46940944/84h/1h/0h]tprv8gSVDBxxdwfYHcp7RhKkrMeaXQRMMrySCXohBcSYKJep4Xc84KGbNcp82meAJ9rFyVTV82n17b36ehM7AUt2MnKweBcNzMnCk8jhzuFML5M/*';
    const expectedFingerprint = '46940944';
    final result = Validation.fingerPrintFromXKey(xkey);
    expect(result, expectedFingerprint);
  });
}
