import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AdminRevenueScreen extends StatelessWidget {
  const AdminRevenueScreen({super.key});

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
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.yellowAccent,
                )),
            title: const Text(
              'Revenue',
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
          body: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 90.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.attach_money_outlined,
                                color: Color.fromARGB(255, 0, 255, 8),
                                size: 45,
                              ),
                              Text(
                                '380000',
                                style: TextStyle(
                                  color: Colors.yellowAccent,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),

                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Card(
                        shadowColor: Colors.grey,
                        child: ListTile(
                          leading: Icon(
                            Icons.attach_money_sharp,
                            color: Colors.green,
                          ),
                          title: Text('User Name'),
                          trailing: Column(
                            children: [
                              Flexible(
                                  child: Text(
                                '+4000',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 34, 235, 41)),
                              )),
                              Flexible(
                                  child: Text(
                                '14/05/2023',
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              )),
                            ],
                          ),
                        ));
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
