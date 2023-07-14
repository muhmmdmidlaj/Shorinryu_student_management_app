import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LeaveApplicationFormScreen extends StatelessWidget {
  const LeaveApplicationFormScreen({super.key});

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
              'Leave Application',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'asset/img/karate-graduation-blackbelt-martial-arts.jpg')),
              
            ),
            child: ListView(scrollDirection: Axis.vertical, children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Full Name',
                          filled: true,
                          fillColor:const Color.fromARGB(153, 189, 184, 184),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 47.w,
                        height: 15.h,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Date',
                                filled: true,
                                fillColor:const Color.fromARGB(153, 189, 184, 184),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                      ),
                     const Text('To', style: TextStyle(color: Colors.yellowAccent)),
                      SizedBox(
                        width: 47.w,
                        height: 15.h,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Date',
                                filled: true,
                                fillColor:const Color.fromARGB(153, 189, 184, 184),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:const Color.fromARGB(153, 189, 184, 184),
                      ),
                      child:const Padding(
                        padding:  EdgeInsets.all(20.0),
                        child: TextField(
                            maxLines: 20,
                            decoration: InputDecoration(
                                hintText: 'Reason',
                                filled: true,
                                fillColor: Colors.transparent,
                                border: InputBorder.none)),
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child:const Text('Submit')),
                ],
              ),
            ]),
          ),
        );
      },
    );
  }
}
