import 'dart:convert';
import 'package:sats/api/interface/cpsocket.dart';
import 'package:web_socket_channel/io.dart';

class CypherpostStream implements ICPSocket {
  IOWebSocketChannel? _channel;

  @override
  void connect({
    required String host,
    required Map<String, String> headers,
    required Function(dynamic) connectEvent,
    required Function(dynamic) messageEvent,
    required Function disconnectEvent,
  }) {
    if (_channel != null) return;

    final uri = Uri.parse('wss://$host/api/v3/notifications');
    print(uri);
    _channel = IOWebSocketChannel.connect(
      uri,
      headers: headers,
    );

    _channel!.stream.listen(
      (message) {
        print('msg::' + message.toString());
        if (message.toString().startsWith('s5')) {
          messageEvent(message);
        } else {
          final data = jsonDecode(message as String);
          if (data['event'] == 'connected')
            connectEvent(data);
          else if (data['event'] == 'disconnect') disconnect();
        }
      },
      onDone: () async {
        disconnect();
        await Future.delayed(const Duration(seconds: 3));
        print('done');
        connect(
          host: host,
          headers: headers,
          connectEvent: connectEvent,
          messageEvent: messageEvent,
          disconnectEvent: disconnectEvent,
        );
      },
      onError: (e) async {
        disconnect();
        await Future.delayed(const Duration(seconds: 3));
        print('err ws :: ' + e.toString());
        connect(
          host: host,
          headers: headers,
          connectEvent: connectEvent,
          messageEvent: messageEvent,
          disconnectEvent: disconnectEvent,
        );
      },
    );
  }

  @override
  void notify(String postId) {
    if (_channel == null) return;
    _channel!.sink.add(postId);
  }

  @override
  void disconnect() {
    if (_channel == null) return;
    _channel!.sink.close();
    // _channel!.stream.
    _channel = null;
  }
}
