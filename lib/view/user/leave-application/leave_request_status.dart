import 'package:flutter/material.dart';
import 'package:shorinryu/view/user/leave-application/leave_application.dart';
import 'package:sizer/sizer.dart';

class LeaveRequestStatusScreen extends StatelessWidget {
  const LeaveRequestStatusScreen({super.key});

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
              'Leave Request Status',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'asset/img/karate-graduation-blackbelt-martial-arts.jpg')),
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.white30, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: ListView.builder(
              itemBuilder: (context, index) => const Card(
                child: ListTile(
                  leading: Text(
                    'date',
                    style: TextStyle(color: Colors.black),
                  ),
                  title: Text('Reason', style: TextStyle(color: Colors.black)),
                  trailing: Text('Appruve/reject',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.yellowAccent,
            child: const Icon(
              Icons.add_circle,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  LeaveApplicationFormScreen(),
                  ));
            },
          ),
        );
      },
    );
  }
}
