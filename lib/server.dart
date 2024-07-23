import 'dart:convert';
import 'dart:io';

void main() async {
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 4000);
  print('WebSocket server running on port 4000');

  server.listen((HttpRequest request) async {
    if (request.uri.path == '/ws') {
      // Upgrade HttpRequest to a WebSocket connection
      WebSocket webSocket = await WebSocketTransformer.upgrade(request);

      webSocket.listen((dynamic message) {
        handleMessage(webSocket, message.toString());
      });

      webSocket.done.then((_) {
        print('WebSocket closed');
      });
    }
  });
}

void handleMessage(WebSocket ws, String message) {
  print('Received message: $message');

  Map<String, dynamic> data = jsonDecode(message);
  String type = data['type'];
  String eventTitle = data['eventTitle'];

  switch (type) {
    case 'createEvent':
      // Simulate creating an event (add to a list, store in database, etc.)
      print('Event "$eventTitle" created');
      break;
    case 'joinEvent':
      print('Client joined event "$eventTitle"');
      break;
    default:
      print('Unknown message type: $type');
  }
}
