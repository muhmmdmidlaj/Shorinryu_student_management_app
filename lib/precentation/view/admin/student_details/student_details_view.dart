import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class AdminStudntDetailsViewPage extends StatelessWidget {
  const AdminStudntDetailsViewPage({super.key});

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
              'User Name',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
          body: const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 60,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Text(
                    'Name :',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('User Name'),
                ),
                ListTile(
                  leading: Text(
                    'Address :',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('User Name'),
                ),
                ListTile(
                  leading: Text(
                    'Post :',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('User Name'),
                ),
                ListTile(
                  leading: Text(
                    'Pin :',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('User Name'),
                ),
                ListTile(
                  leading: Text(
                    'Aadhar/PAN :',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('User Name'),
                ),
                ListTile(
                  leading: Text(
                    'Contact No :',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('User Name'),
                ),
                ListTile(
                  leading: Text(
                    'Altranate No :',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('User Name'),
                ),
                ListTile(
                  leading: Text(
                    'Mail Id :',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('User Name'),
                ),
                ListTile(
                  leading: Text(
                    'DOB :',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('User Name'),
                ),
                ListTile(
                  leading: Text(
                    'Age :',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('User Name'),
                ),
                ListTile(
                  leading: Text(
                    'Parent Name :',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('User Name'),
                ),
                ListTile(
                  leading: Text(
                    'Parent Phone No :',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('User Name'),
                ),
                ListTile(
                  leading: Text(
                    'Gender :',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('User Name'),
                ),
                ListTile(
                  leading: Text(
                    'Married Status :',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: Text('User Name'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
