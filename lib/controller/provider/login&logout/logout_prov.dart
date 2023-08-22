import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorinryu/view/login&register/login.dart';

class LogOutProvider extends ChangeNotifier {
  Future<void> logOut(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('refreshKey');
    await prefs.remove('accessKey');
    await prefs.remove('userId');
    await prefs.remove('user');
    prefs.setBool('loggind', false);
    prefs.setBool('isUserLogined', false);
    prefs.setBool('isRegistered', false);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
        (route) => false);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.green,
      content: Text('Log Out Success'),
    ));
  }
}
