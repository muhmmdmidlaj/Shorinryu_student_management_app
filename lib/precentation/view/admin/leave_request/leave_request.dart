import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AdminLeaveRequestViewScreen extends StatelessWidget {
  const AdminLeaveRequestViewScreen({super.key});

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
              'Leave Request',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                radius: 6.w,
              ),
              title: Text('User Name'),
              trailing: Column(
                children: [
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 36, 234, 43))),
                          onPressed: () {},
                          child: Text('Accept'),
                        ),
                      )),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                const Color.fromARGB(255, 245, 52, 38))),
                        onPressed: () {},
                        child: Text('Reject '),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
