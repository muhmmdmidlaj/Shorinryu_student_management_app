import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorinryu/model/core/base_url/base_url.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketProvider extends ChangeNotifier {
  TextEditingController notificationController = TextEditingController();

  late final WebSocketChannel channel;
  List<Map<String, dynamic>> receivedMessages = [];

  WebsocketProvider() {
    channel = WebSocketChannel.connect(
      Uri.parse('ws://172.20.10.3:8000/ws/notifications/'),
    );

    // Listen to incoming messages and add them to receivedMessages
    channel.stream.listen((data) {
      if (data is Map<String, dynamic> && data['type'] == 'notification') {
        receivedMessages.add(data);

        notifyListeners(); // Notify listeners about new messages
      }
    });
  }

  Future<bool> webSocketSentMessage() async {
    if (notificationController.text.isNotEmpty) {
      try {
        channel.sink.add({
          "type": "notification",
          "message": notificationController.text.toString(),
        });
        return true; // Successful sending
      } catch (e) {
        print('Error sending notification: $e');
      }
    }
    return false; // Failed sending
  }

  @override
  void dispose() {
    channel.sink.close();
    notificationController.clear();
    super.dispose();
  }

  Future<bool> postNotification() async {
    final jsonData = json.encode({
      'content_message': notificationController.text.toString(),
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // pref.setBool('leaveApply', false);
    final accessKey = prefs.getString('accessKey');

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/sockets/notifications/'),
        body: jsonData,
        headers: {
          'Authorization': 'Bearer $accessKey',
          'Content-Type': 'application/json'
        },
      );

      if (response.statusCode == 201) {
        print('notification submitted successfully.');
        return true;
      } else {
        print('falsssssssssss');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
