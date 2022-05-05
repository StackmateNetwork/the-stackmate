import 'package:flutter/services.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/interface/vibrate.dart';

class Vibrate implements IVibrate {
  @override
  R<bool> vibe() {
    try {
      HapticFeedback.selectionClick();
      return const R(result: true);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }
}
