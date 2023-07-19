import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AdminAttendenceMarkScreen extends StatelessWidget {
  const AdminAttendenceMarkScreen({super.key});

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
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.yellowAccent,
                )),
            backgroundColor: Colors.black.withOpacity(0.7300000190734863),
            title: const Text(
              'Mark Attendance',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
          body: Container(
            decoration:const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('asset/img/splashImage.jpg'))),
            child: ListView.builder(
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 6.w,
                  ),
                  title:const Text('User Name'),
                  trailing: Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
