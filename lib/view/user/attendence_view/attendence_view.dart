import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AttendenceViewScreen extends StatelessWidget {
  const AttendenceViewScreen({super.key});

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
              'Attendence Details',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          'asset/img/karate-graduation-blackbelt-martial-arts.jpg')),
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.white38, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 20.h,
                        width: 35.5.w,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(149, 0, 0, 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Precent Days',
                                style: TextStyle(
                                    color: Colors.yellowAccent, fontSize: 17),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '65',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 1, 255, 9),
                                    fontSize: 35,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 20.h,
                        width: 35.5.w,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(149, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Absent Days',
                                style: TextStyle(
                                    color: Colors.yellowAccent, fontSize: 17),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '10',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 17, 0),
                                    fontSize: 35,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 62.h,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(185, 0, 0, 0),
                        borderRadius: BorderRadius.circular(20)),
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) => const ListTile(
                        leading: Text(
                          '15',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.yellowAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          'Present',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 255, 8),
                          ),
                        ),
                        title: Text(
                          'March 2023',
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.yellowAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
