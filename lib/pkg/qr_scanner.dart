import 'package:flutter/material.dart';
import 'package:sats/pkg/interface/qr_scanner.dart';
import 'package:sats/ui/component/common/QrScannerPage.dart';

/// Navigator used by services that must present UI without a BuildContext.
final rootNavigatorKey = GlobalKey<NavigatorState>();

class QrScanner implements IQrScanner {
  @override
  Future<String> scan() async {
    final navigator = rootNavigatorKey.currentState;
    if (navigator == null) return '';
    final result = await navigator.push<String>(
      MaterialPageRoute(builder: (_) => const QrScannerPage()),
    );
    return result ?? '';
  }
}
