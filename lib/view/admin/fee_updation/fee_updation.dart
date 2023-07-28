import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FeeUpadationStatusScreen extends StatelessWidget {
  const FeeUpadationStatusScreen({super.key});

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
              'Fee Updation',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                radius: 6.w,
              ),
              title: Text('User Name'),
              trailing: Text('Paid/Not Paid'),
            ),
          ),
        );
      },
    );
  }
}
