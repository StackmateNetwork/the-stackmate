// ignore: avoid_escaping_inner_quotes
import 'package:flutter_test/flutter_test.dart';
import 'package:sats/api/libtor.dart';
import 'package:sats/model/result.dart';

void main() {
  late LibTor libtor;
  var controlKey = const R(result: 'control_key');
  const path = '/tmp';

  setUp(() async {
    libtor = LibTor();
  });
  test('Start Tor', () async {
    controlKey = libtor.torStart(
      path: path,
      socks5Port: '29050',
      httpProxy: '',
    );
    assert(!controlKey.hasError);
  });
}
