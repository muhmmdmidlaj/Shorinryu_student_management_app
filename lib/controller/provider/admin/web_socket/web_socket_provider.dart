import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketProvider extends ChangeNotifier {
  TextEditingController notificationController = TextEditingController();
  final channel = WebSocketChannel.connect(
        Uri.parse('ws://127.0.0.1:8000/ws/notifications/'));
  Future<void> webSocketSentMessage() async {
  
    channel.sink.add({"type": "notification", "message": notificationController.text});
  }

   void dispose() {
    channel.sink.close();
    notificationController.dispose();
    super.dispose();
  }
}
