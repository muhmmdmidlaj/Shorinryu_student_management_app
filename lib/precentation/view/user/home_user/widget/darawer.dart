import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => Drawer(
        width: 70.w,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                 const CircleAvatar(
                    radius: 70,
                  ),
                 const SizedBox(
                    height: 15,
                  ),
                const  Text('User Name'),
                 const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child:const Text('    Edit Profile   '),
                  ),
                 const Card(
                    child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                 const Card(
                    child: ListTile(
                      leading: Icon(Icons.share),
                      title: Text('Share'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                 const Card(
                    child: ListTile(
                      leading: Icon(Icons.logout_rounded),
                      title: Text('Log Out'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
