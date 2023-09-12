import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

late WebSocketChannel channel;

class ChatWebsocketProvider extends ChangeNotifier {
  Future<void> chatWebInitiolizer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessKey = prefs.getString('accessKey');

    channel = WebSocketChannel.connect(
      Uri.parse('ws://10.4.5.143:8000/ws/messages/?token=$accessKey'),
    );
  }
}
