import 'package:flutter/material.dart';
import 'package:shorinryu/model/users_get_model/users_get_model.dart';
import 'package:sizer/sizer.dart';

class AdminStudntDetailsViewPage extends StatelessWidget {
  const AdminStudntDetailsViewPage({super.key, required this.userData});
  final UsersGetModel userData;

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
              '',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
          body: FutureBuilder(
            future: Future.delayed(Duration(seconds: 2)), // Simulating a delay
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: userData.profilePicture == null
                            ? const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('asset/img/PROFILE.png'),
                              )
                            : CircleAvatar(
                                backgroundImage:
                                    NetworkImage(userData.profilePicture),
                                radius: 70,
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        leading: const Text(
                          'Name :',
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(
                          userData.name ?? '',
                        ),
                      ),
                      ListTile(
                        leading: const Text(
                          'Address :',
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(userData.address ?? 'Nill'),
                      ),
                      ListTile(
                        leading: const Text(
                          'Post :',
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(userData.post ?? 'Nill'),
                      ),
                      ListTile(
                        leading: const Text(
                          'Pin Number:',
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(userData.pincode != null
                            ? userData.pincode.toString()
                            : 'N/A'),
                      ),
                      ListTile(
                        leading: const Text(
                          'Aadhar:',
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(userData.aadharNumber != null
                            ? userData.aadharNumber.toString()
                            : 'N/A'),
                      ),
                      ListTile(
                        leading: const Text(
                          'Contact No :',
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(userData.number != null
                            ? userData.number.toString()
                            : 'N/A'),
                      ),
                      ListTile(
                        leading: const Text(
                          'Altranate No :',
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(userData.alternateNumber != null
                            ? userData.alternateNumber.toString()
                            : 'N/A'),
                      ),
                      ListTile(
                        leading: const Text(
                          'Mail Id :',
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(userData.email ?? 'Nill'),
                      ),
                      ListTile(
                        leading: const Text(
                          'DOB :',
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(userData.dateOfBirth.toString()),
                      ),
                      ListTile(
                        leading: Text(
                          'Age :',
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(userData.age.toString()),
                      ),
                      ListTile(
                        leading: const Text(
                          'Parent Name :',
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(userData.guardianName),
                      ),
                      ListTile(
                          leading: const Text(
                            'Parent Phone No :',
                            style: TextStyle(fontSize: 20),
                          ),
                          title: Text(userData.guardianContactNumber != null
                              ? userData.guardianContactNumber.toString()
                              : 'N/A')),
                      ListTile(
                        leading: const Text(
                          'Gender :',
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(userData.gender ?? 'NIll'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
