// ignore: avoid_escaping_inner_quotes
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sats/model/coldcard.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  test('TEST CC Parse', () async {
    // final String response = await rootBundle
    //     .loadString('test/resources/coldcard-export-testnet.json');
    // final data = await json.decode(response);
    final file = File('test/resources/coldcard-export-testnet.json');
    final json = jsonDecode(await file.readAsString());
    final ColdCardGeneric ccWatcher =
        ColdCardGeneric.fromJson(json as Map<String, dynamic>);
    assert(ccWatcher.chain == 'XTN');
    const expectedLegacyPolicy =
        'pk([efab2046/44h/1h/0h}]tpubDC4aoM5HbUhASitj53NF232tkuGdPwKfUbSNa64puihCRgZ8L81N8p1VfqdC7y5QtANSJqsLup4smgkfNLTKHpnw9dd5xNXg6jCGTrncm6h/*)';
    assert(ccWatcher.bip44Policy == expectedLegacyPolicy);
    const expectedScriptPolicy =
        'pk([efab2046/49h/1h/0h}]tpubDCw55JYr2oyHnevDv4CTVHXPWoxC3LjsyjzCCMCFNZgRh5jFCdMgNB3WFecRd777m8GCnFBk5z2fiUT8g8KZShZdF9iqWhKVdUfFDqKF6HG/*)';
    assert(ccWatcher.bip49Policy == expectedScriptPolicy);
    const expectedSegwitPolicy =
        'pk([efab2046/84h/1h/0h}]tpubDCBtCtWDzqBZRjMzFbtSDFvTQkKhN2gdKyAG6cDVGqGo9zeUDwCuL73XEszmJc1Do7aE8rxtzoDdkEm8GvX4FPQrqpZHgwhpTNAUALq9kd7/*)';
    assert(ccWatcher.bip84Policy == expectedSegwitPolicy);
  });
}
