import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AdminChatscreenView extends StatelessWidget {
  const AdminChatscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.yellowAccent,
                )),
            backgroundColor: Colors.black.withOpacity(0.7300000190734863),
            title: const Text(
              'UserName',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
        );
      },
    );
  }
}
