import 'package:flutter/material.dart';
import 'package:shorinryu/precentation/view/user/attendence_view/attendence_view.dart';
// import 'package:shorinryu/precentation/view/user/leave-application/leave_application.dart';
import 'package:shorinryu/precentation/view/user/leave-application/leave_request_status.dart';
import 'package:shorinryu/precentation/view/user/new_applycation/new_admission.dart';
import 'package:sizer/sizer.dart';

class HomePageUser extends StatelessWidget {
  const HomePageUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          drawer: SingleChildScrollView(
            child: Container(
              height: 90.h,
              width: 70.w,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      
                    ],
                  ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Drawer(
                    child: SingleChildScrollView(
                      child: Container(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.list,
                  color: Colors.yellowAccent,
                )),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.yellowAccent),
            ),
            // toolbarHeight: 60,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.7300000190734863),
                Colors.black,
                Colors.black.withOpacity(0.7300000190734863),
              ])),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'asset/img/karate-graduation-blackbelt-martial-arts.jpg',
                  )),
              gradient: LinearGradient(
                colors: [Color(0xFF07F7F7), Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                      width: 40.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Column(children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.supervised_user_circle_sharp,
                            // color: Colors.white50,
                            size: 55,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'New Addmission',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ]),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewAdmissionScreen(),
                          ));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                      width: 40.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Column(children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.chat,
                            size: 55,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Chat With Master',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                      width: 40.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Column(children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.no_accounts_sharp,
                            size: 55,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Leave Application',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ]),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LeaveRequestStatusScreen(),
                          ));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                      width: 40.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Column(children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.payment,
                            size: 55,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Pay Fees',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                      width: 40.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Column(children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.follow_the_signs_sharp,
                            size: 55,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Attendance',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ]),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AttendenceViewScreen(),
                          ));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                      width: 40.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Column(children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.notification_important_sharp,
                            size: 55,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Announcement',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
