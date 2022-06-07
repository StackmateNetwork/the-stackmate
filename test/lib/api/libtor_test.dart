// ignore: avoid_escaping_inner_quotes
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sats/api/libtor.dart';
import 'package:sats/model/result.dart';

void main() {
  late LibTor libtor;
  var controlKey = const R(result: 'control_key');
  final path = Directory.systemTemp.toString();

  setUp(() async {
    libtor = LibTor();
  });
  test('TEST TOR', () async {
    controlKey = await compute(daemonStart, {
      'path': path,
      'socks5Port': '29050',
      'httpProxy': '',
    });
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

    print(status.result);

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

    print(status.result);
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

    print(status.result);

    final stop = libtor.torStop(
      controlPort: '28950',
      controlKey: controlKey.result!,
    );
    print(stop.result);

    assert(!stop.hasError);
    assert(stop.result == 'true');
  });

  test('TEST TOR OUT OF SCOPE: Start', () async {
    controlKey = libtor.torStart(
      path: path,
      socks5Port: '29050',
      httpProxy: '',
    );
    assert(!controlKey.hasError);
  });
  test('TEST TOR OUT OF SCOPE: Progress', () async {
    controlKey = libtor.torStart(
      path: path,
      socks5Port: '29050',
      httpProxy: '',
    );
    assert(!controlKey.hasError);

    var progress = libtor.torStatus(
      controlPort: '28950',
      controlKey: controlKey.result!,
    );
    assert(!progress.hasError);

    print(progress.result);
  });
}

Future<R<String>> daemonStart(dynamic data) async {
  final obj = data as Map<String, String?>;

  final resp = LibTor().torStart(
    path: obj['path']!,
    socks5Port: obj['socks5Port']!,
    httpProxy: obj['httpProxy']!,
  );

  return resp;
}
