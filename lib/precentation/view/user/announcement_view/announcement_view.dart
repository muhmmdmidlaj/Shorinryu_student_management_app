import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AnnouncementViewScreen extends StatelessWidget {
  const AnnouncementViewScreen({super.key});

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
              itemBuilder: (context, index) =>const Card(
                child: ListTile(
                  
                  leading: Icon(Icons.notifications),
                  title: Text('Content'),
                  trailing: Text('time/date'),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
