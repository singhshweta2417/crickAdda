import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late WebSocketChannel _channel;

  void connect(String url, Function(dynamic) onDataReceived) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    print("WebSocket connected to URL: $url");
    _channel.stream.listen(
          (event) {
        print("Raw data received: $event");
        final data = json.decode(event);
        onDataReceived(data);
      },
      onError: (error) {
        print("WebSocket error: $error");
      },
      onDone: () {
        print("WebSocket connection closed.");
      },
    );
  }

  void disconnect() {
    _channel.sink.close();
    print("WebSocket disconnected.");
  }
}
