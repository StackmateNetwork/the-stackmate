// import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:flutter/services.dart';

abstract class IVibrate {
  void vibe();
}

class Vibrate implements IVibrate {
  @override
  void vibe() async {
    HapticFeedback.selectionClick();

    // bool canVibrate = await Vibrate.canVibrate;
    // if (canVibrate) {
    //   Vibrate.feedback(FeedbackType.impact);
    // }
  }
}

class DummyVibrate implements IVibrate {
  @override
  void vibe() async {}
}
