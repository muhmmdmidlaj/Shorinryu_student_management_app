import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorinryu/controller/provider/admin/web_socket/web_socket_provider.dart';
import 'package:sizer/sizer.dart';

class AnnouncementViewScreen extends StatelessWidget {
  const AnnouncementViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Consumer<WebsocketProvider>(
          builder: (context, webSocketProvider, child) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.yellowAccent,
                  )),
              backgroundColor: Colors.black.withOpacity(0.7300000190734863),
              title: const Text(
                'Updations',
                style: TextStyle(color: Colors.yellowAccent),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'asset/img/karate-graduation-blackbelt-martial-arts.jpg'),
                ),
              ),
              child: ListView.builder(
                itemCount: webSocketProvider.receivedMessages.length,
                itemBuilder: (context, index) {
                  final message = webSocketProvider.receivedMessages[index];
                  return StreamBuilder(
                    stream: webSocketProvider.channel.stream,
                    builder: (context, snapshot) {
                      return Text(snapshot.hasData
                          ? '${snapshot.data}'
                          : message.toString());
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void showAnnouncementContent(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              Container(
                height: 200,
                width: 200,
              )
            ],
          );
        });
  }
}
