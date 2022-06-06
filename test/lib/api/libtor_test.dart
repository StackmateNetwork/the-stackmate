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
  test('TEST TOR', () async {
    controlKey = libtor.torStart(
      path: path,
      socks5Port: '29050',
      httpProxy: '',
    );
    assert(!controlKey.hasError);
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    var status = libtor.torStatus(
      controlPort: '28950',
      controlKey: controlKey.result!,
    );
    assert(!status.hasError);

    print(status.result!);

    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    status = libtor.torStatus(
      controlPort: '28950',
      controlKey: controlKey.result!,
    );
    assert(!status.hasError);

    print(status.result!);
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    status = libtor.torStatus(
      controlPort: '28950',
      controlKey: controlKey.result!,
    );
    assert(!status.hasError);

    print(status.result!);

    final stop = libtor.torStop(
      controlPort: '28950',
      controlKey: controlKey.result!,
    );
    print(stop.result);

    assert(!stop.hasError);
    assert(stop.result == 'true');
  });
}
