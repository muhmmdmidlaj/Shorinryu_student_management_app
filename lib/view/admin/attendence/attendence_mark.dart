import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorinryu/controller/provider/admin/atendance_provider/attandence_prov.dart';
import 'package:shorinryu/controller/provider/admin/user_get_details/user_details_get_prov.dart';
import 'package:shorinryu/model/users_get_model/users_get_model.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class CheckboxState {
  bool value = false;
}

class AdminAttendenceMarkScreen extends StatelessWidget {
  const AdminAttendenceMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserGetProvider>(context);
    final attendanceProvider = Provider.of<AttandenceState>(context);
    final users = userProvider.users;
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
              ),
            ),
            backgroundColor: Colors.black.withOpacity(0.73),
            title: const Text(
              'Mark Attendance',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
          body: SizedBox(
            child: Column(
              children: [
                FutureBuilder(
                  future: userProvider.fetchUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (users.isEmpty) {
                      return const Center(child: Text('No users available.'));
                    } else {
                      return Consumer<AttandenceState>(
                        builder: (context, attendanceProvider, child) =>
                            Expanded(
                          child: ListView.builder(
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              final UsersGetModel userData = users[index];
                              final user = attendanceProvider.users[index];
                              // Check if the user is not a superuser
                              if (userData.isSuperuser == false) {
                                return Card(
                                  child: ListTile(
                                    title: Text(userData.name ?? ''),
                                    subtitle: Text(userData.email ?? ''),
                                    trailing: Checkbox(
                                      value: user.value,

                                      // value: user.
                                      onChanged: (newValue) {
                                        attendanceProvider.updateValue(
                                            index, newValue!);

                                        final now = DateTime.now();
                                        final formattedDate =
                                            '${now.year}-${_twoDigits(now.month)}-${_twoDigits(now.day)}';

                                        final attendanceData = {
                                          'user_id': userData.id,
                                          'attendance_date': formattedDate,
                                          'is_present': newValue,
                                        };

                                        if (newValue) {
                                          attendanceProvider.addAttendanceData(
                                              attendanceData);
                                        } else {
                                          attendanceProvider
                                              .removeAttendanceData(
                                                  userData.id as int);
                                        }
                                      },
                                    ),
                                    leading: ClipOval(
                                      child: userData.profilePicture != null
                                          ? Image.network(
                                              userData.profilePicture!,
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            )
                                          : const Icon(Icons.person),
                                    ),
                                    onTap: () {},
                                  ),
                                );
                              } else {
                                // Return an empty Container for superusers
                                return Container();
                              }
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    final SharedPreferences prfrc =
                        await SharedPreferences.getInstance();

                    await attendanceProvider.postAttendanceData(
                        attendanceProvider.attendanceDataList);
                    if (prfrc.getBool('isAttantanceMark') == true) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Attendance Mark success full')));
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }
}
