import 'package:flutter/cupertino.dart';
import 'package:test/test.dart';
import 'package:utopic_tor_onion_proxy/utopic_tor_onion_proxy.dart';

void main() {
  group('Tor Lib', () {
    setUp(() async {
      WidgetsFlutterBinding.ensureInitialized();
    });
    tearDown(() {});

    test('Test utopic tor library', () async {
      final port = await UtopicTorOnionProxy.startTor();
      assert(port != 0);
      var isRunning = await UtopicTorOnionProxy.isTorRunning();
      assert(!isRunning!);
      await Future.delayed(Duration(seconds: 10));
      isRunning = await UtopicTorOnionProxy.isTorRunning();
      assert(isRunning!);
      final stopStatus = await UtopicTorOnionProxy.stopTor();
      assert(stopStatus!);
    });
  });
}
