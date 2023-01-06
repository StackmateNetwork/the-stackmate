abstract class ICPSocket {
  void connect({
    required String host,
    required Map<String, String> headers,
    required Function(dynamic) connectEvent,
    required Function(dynamic) messageEvent,
    required Function disconnectEvent,
  });
  void notify(String postId);
  void disconnect();
}
