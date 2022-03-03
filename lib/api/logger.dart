import 'package:sats/api/interface/logger.dart';

class SentryLogger implements ILogAPI {
  @override
  Future<void> log(String log) async {
    // send log to API
  }
}

class DummyLogAPI implements ILogAPI {
  @override
  Future<void> log(String log) async {}
}
