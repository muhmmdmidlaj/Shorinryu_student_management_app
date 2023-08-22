import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketProvider extends ChangeNotifier {
  TextEditingController notificationController = TextEditingController();

  late final WebSocketChannel channel;
  List<Map<String, dynamic>> receivedMessages = [];

  WebsocketProvider() {
    channel = WebSocketChannel.connect(
      Uri.parse('ws://10.0.13.11:8000/ws/notifications/'),
    );

    // Listen to incoming messages and add them to receivedMessages
    channel.stream.listen((data) {
      if (data is Map<String, dynamic> && data['type'] == 'notification') {
        receivedMessages.add(data);
        notifyListeners(); // Notify listeners about new messages
      }
    });
  } 

  void webSocketSentMessage() {
    if (notificationController.text.isNotEmpty) {
      channel.sink.add({
        "type": "notification",
        "message": notificationController.text.toString(),
      });
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    notificationController.dispose();
    super.dispose();
  }
}
