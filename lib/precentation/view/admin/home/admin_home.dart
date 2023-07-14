import 'package:flutter/material.dart';
import 'package:shorinryu/precentation/view/admin/attendence/attendence_mark.dart';
import 'package:shorinryu/precentation/view/admin/chat/chat_list/chat_list.dart';
import 'package:shorinryu/precentation/view/admin/fee_updation/fee_updation.dart';
import 'package:shorinryu/precentation/view/admin/leave_request/leave_request.dart';
import 'package:shorinryu/precentation/view/admin/student_details/student_details.dart';
import 'package:shorinryu/precentation/view/admin/video_confrence/video_confrence_list.dart';
import 'package:sizer/sizer.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.yellowAccent,
                )),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.yellowAccent),
            ),
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
                            Icons.task_outlined,
                            size: 55,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Mark Attendance',
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
                            builder: (context) => AdminAttendenceMarkScreen(),
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
                            Icons.monetization_on,
                            size: 55,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Fee Updation',
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
                            builder: (context) =>
                                const FeeUpadationStatusScreen(),
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
                            Icons.supervised_user_circle_sharp,
                            size: 55,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Student Details',
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
                          builder: (context) =>
                              const AdminStudentDetailsViewScreen(),
                        ),
                      );
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
                            'Chat With Student',
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
                          builder: (context) => const AdminChatListScreen(),
                        ),
                      );
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
                            Icons.no_accounts,
                            size: 55,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Leave Request',
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
                          builder: (context) =>
                              const AdminLeaveRequestViewScreen(),
                        ),
                      );
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
                            Icons.video_call,
                            size: 55,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Video Conference',
                            style: TextStyle(
                                fontSize: 20,
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
                            builder: (context) => VideoConfrenceListScreen(),
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
                            Icons.monetization_on_outlined,
                            size: 55,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Revenue',
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
                            Icons.announcement,
                            size: 55,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Sent Updation',
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
