import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorinryu/controller/provider/admin/chat_provider/chat_provider.dart';
import 'package:shorinryu/model/chat_model/chat_model.dart';
import 'package:shorinryu/model/users_get_model/users_get_model.dart';
import '../../../controller/provider/chat_wbsocket_provider/chat_websocket_privider.dart';

class UserChatScreen extends StatelessWidget {
  final int id;
  final int reciever = 1;
  const UserChatScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<MessageProvider>(
              builder: (context, messageProvider, _) {
                final messages =
                    messageProvider.chatmessagess.reversed.toList();

                // Filter messages based on receiver ID
                final receiverMessages = messages
                    .where((message) => message.receiver == reciever)
                    .toList();

                return ListView.builder(
                  itemCount: receiverMessages.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    final message = receiverMessages[index];

                    // Check if the message is sent by the current user
                    final isMyMessage = message.sender == id;

                    return MessageWidget(
                      message: message,
                      isMyMessage: isMyMessage,
                    );
                  },
                );
              },
            ),
          ),
          _ChatInputField(receiverId: reciever.toString()),
        ],
      ),
    );
  }
}

class _ChatInputField extends StatefulWidget {
  final String receiverId;

  const _ChatInputField({required this.receiverId});

  @override
  _ChatInputFieldState createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<_ChatInputField> {
  @override
  Widget build(BuildContext context) {
    final messageProvider = context.read<MessageProvider>();

    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageProvider.chattextEditingController,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () async {
              final text =
                  messageProvider.chattextEditingController.text.trim();
              if (text.isNotEmpty) {
                messageProvider.chattextEditingController.clear();
                messageProvider.fetchNotification();
                channel.sink.add(jsonEncode({
                  "type": "message",
                  "message": {"text": text, "receiver_id": widget.receiverId}
                }));
              }
            },
          ),
        ],
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final MessageChat message;
  final bool isMyMessage;

  const MessageWidget(
      {super.key, required this.message, required this.isMyMessage});

  @override
  Widget build(BuildContext context) {
    final alignment =
        isMyMessage ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: isMyMessage
                ? const Color.fromARGB(255, 124, 104, 126)
                : const Color.fromARGB(255, 129, 177, 216),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                message.text,
                style: TextStyle(
                  color: isMyMessage ? Colors.white : Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
