import 'package:flutter/material.dart';
import 'package:shorinryu/view/admin/student_details/student_details_view.dart';
import 'package:sizer/sizer.dart';

class AdminStudentListViewScreen extends StatelessWidget {
  const AdminStudentListViewScreen({super.key});

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
              'Student List',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 6.w,
                ),
                title: const Text('User Name'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>const AdminStudntDetailsViewPage(),
                      ));
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
