import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

late WebSocketChannel channel;

class ChatWebsocketProvider extends ChangeNotifier {
  Future<void> chatWebInitiolizer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessKey = prefs.getString('accessKey');

    channel = WebSocketChannel.connect(
      Uri.parse('ws://13.233.11.227/ws/messages/?token=$accessKey'),
    );
  }
}
