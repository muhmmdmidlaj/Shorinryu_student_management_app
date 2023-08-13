import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorinryu/model/core/base_url/base_url.dart';
import 'package:shorinryu/view/admin/home/admin_home.dart';
import 'package:shorinryu/view/login&register/login.dart';
import 'package:shorinryu/view/user/home_user/home.dart';

Future<void> registerUser(Map<String, dynamic> userData, context) async {
  const String apiUrl = '$baseUrl/user/register/';
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // Convert user data to JSON
  final jsonData = json.encode(userData);

  try {
    // Send POST request to register the user
    final response =
        await http.post(Uri.parse(apiUrl), body: jsonData, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 201) {
      prefs.setBool('loggind', true);
       prefs
          .setString('refreshKey', jsonDecode(response.body)['refresh'])
          .toString();
      prefs
          .setString('accessKey', jsonDecode(response.body)['access'])
          .toString();
      final userData = jsonDecode(response.body)['user'];
      final userId = jsonDecode(response.body)['user']['id'].toString();
      // final String id = userData['id']; // Extract user ID
      await prefs.setString('userId', userId);
      

      await prefs.setString('user', jsonEncode(userData));

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePageUser()),
        (route) => false,
      );
      

      // Show a success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Registration Successful'),
        ),
      );

      // Return the user ID on successful registration
    } else {
      final responseData = json.decode(response.body);
      final String errorMessage = responseData['message'];

      // Show an error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Registration Failed: $errorMessage'),
        ),
      );
    }
  } catch (e) {
    print('An error occurred: $e');

    // Show an error SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text('An error occurred during registration.'),
      ),
    );
  }
}

Future<void> loginUser(Map<String, dynamic> loginData, context) async {
  const String apiUrl = '$baseUrl/user/login/';

  final jsonData = json.encode(loginData);

  try {
    // Send POST request to login the user
    final response =
        await http.post(Uri.parse(apiUrl), body: jsonData, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('refreshKey', jsonDecode(response.body)['refresh']);
      await prefs.setString('accessKey', jsonDecode(response.body)['access']);
      final userData = jsonDecode(response.body)['user'];
      await prefs.setString('user', jsonEncode(userData));
      final userId = jsonDecode(response.body)['user']['id'].toString();
      await prefs.setString('userId', userId);
      final isSuperUser = jsonDecode(response.body)['user']['is_superuser'];
      if (isSuperUser == true) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>const AdminHomeScreen(),
            ),
            (route) => false);
      }

    
      // await prefs.setString('userId', jsonDecode(response.body)['user']['id']);
      if (isSuperUser == false) {
        prefs.setBool('loggind', true);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePageUser()),
          (route) => false,
        );
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Login Successfull'),
        ),
      );

      print('Success');
    } else {
      print('error');
      final responseData = json.decode(response.body);
      final String errorMessage = responseData['message'];

      print('Login Failed: $errorMessage');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Login Failed: $errorMessage'),
        ),
      );
    }
  } catch (e) {
    print('An error occurred: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text('An error occurred during login.'),
      ),
    );
  }
}

Future<void> logOut(context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('refreshKey');
  await prefs.remove('accessKey');
  await prefs.remove('userId');
  await prefs.remove('user');
  prefs.setBool('loggind', false);

  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
      (route) => false);
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    backgroundColor: Colors.green,
    content: Text('Log Out Success'),
  ));
}
