import 'dart:ffi';
import 'dart:io';

import 'package:libstackmate/libstackmate.dart';
import 'package:sats/api/interface/libtor.dart';
import 'package:sats/model/result.dart';

class LibTor implements IStackMateTor {
  LibTor() {
    _libstackmate = LibStackmateFFI(
      binary: Platform.isAndroid
          ? DynamicLibrary.open('libstackmate.so')
          : Platform.isIOS
              ? DynamicLibrary.process()
              : Platform.isMacOS
                  ? DynamicLibrary.open(
                      'packages/libstackmate/macos/x86_64/libstackmate.dylib',
                    )
                  : DynamicLibrary.open(
                      'packages/libstackmate/linux/x86_64/libstackmate.so',
                    ),
    );
  }

  late LibStackmateFFI _libstackmate;

  @override
  R<String> torStart({
    required String path,
    required String socks5Port,
    required String httpProxy,
  }) {
    final resp = _libstackmate.torStart(
      path: path,
      socsk5Port: socks5Port,
      httpProxy: httpProxy,
    );

    if (resp.contains('Error')) {
      return R(error: SMError.fromJson(resp).message);
    }

    return R(result: resp);
  }

  @override
  R<String> torStatus({
    required String controlPort,
    required String controlKey,
  }) {
    final resp = _libstackmate.torStatus(
      controlPort: controlPort,
      controlKey: controlKey,
    );

    if (resp.contains('Error')) {
      return R(error: SMError.fromJson(resp).message);
    }

    return R(result: resp);
  }

  @override
  R<String> torStop({
    required String controlPort,
    required String controlKey,
  }) {
    final resp = _libstackmate.torStop(
      controlPort: controlPort,
      controlKey: controlKey,
    );

    if (resp.contains('Error')) {
      return R(error: SMError.fromJson(resp).message);
    }

    return R(result: resp);
  }
}
