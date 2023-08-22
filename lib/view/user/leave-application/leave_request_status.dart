import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorinryu/controller/provider/user/leave_appplication_provider/leave_apply_provi.dart';
import 'package:shorinryu/controller/provider/user/user_leave_application_get.dart';
import 'package:shorinryu/model/user_leave_request_model/user_leave_request_model.dart';
import 'package:shorinryu/view/user/leave-application/leave_application.dart';
import 'package:sizer/sizer.dart';

class LeaveRequestStatusScreen extends StatelessWidget {
  const LeaveRequestStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Consumer<UserLeaveApplycationGet>(
          builder: (context, userReservationProvider, child) => Scaffold(
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
                child: FutureBuilder<List<UserLeaveRequestModel>>(
                  future: userReservationProvider.userFetchLeaveRequests(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      List<UserLeaveRequestModel> leaveRequests =
                          snapshot.data!;

                      return ListView.builder(
                        itemCount: leaveRequests.length,
                        itemBuilder: (context, index) {
                          leaveRequests = leaveRequests.reversed.toList();
                          final UserLeaveRequestModel request =
                              leaveRequests[index];

                          return Card(
                            child: ListTile(
                              leading: Text(
                                  "${request.start.toString()}\n${request.end.toString()}"),
                              title: Text('${request.reasone.toString()}'),
                              // subtitle: Text(
                              //     'Start: ${request.start} \n End: ${request.end}'),
                              trailing: Text(
                                request.isApproved == true
                                    ? 'Accepted'
                                    : 'Pending',
                                style: TextStyle(
                                    color: request.isApproved == true
                                        ? const Color.fromARGB(255, 58, 242, 64)
                                        : Colors.red),
                              ),
                              // Customize the ListTile as needed
                            ),
                          );
                        },
                      );
                    }
                  },
                )),
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
                      builder: (context) => LeaveApplicationFormScreen(),
                    ));
              },
            ),
          ),
        );
      },
    );
  }
}
