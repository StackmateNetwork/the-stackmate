abstract class ILogAPI {
  Future<void> log(String log);
}

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
