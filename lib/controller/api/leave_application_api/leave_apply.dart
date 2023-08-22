import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shorinryu/model/user_leave_request_model/user.dart';

Future<bool> postLeaveRequest(Map<String, dynamic> leaveData, String url,
    String accessKey, context) async {
  final jsonData = json.encode(leaveData);
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setBool('leaveApply', false);

  try {
    final response = await http.post(
      Uri.parse(url),
      body: jsonData,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessKey',
      },
    );
    final applicationId = jsonDecode(response.body)['id'];
    await pref.setInt('applicationId', applicationId);
    print(accessKey);
    print(applicationId);

    if (response.statusCode == 201) {
      // final fromDate = jsonDecode(response.body)['start'];
      // await pref.setString('startDate', fromDate);
      // final toDate = jsonDecode(response.body)['end'];
      // await pref.setString('endDate', toDate);
      // final status = jsonDecode(response.body)['is_approved'];
      // await pref.setString('LeaveStatus', status);
      pref.setBool('leaveApply', true);

      print('Leave request submitted successfully.');
      return true;
    } else {
      final responseData = json.decode(response.body);
      final String errorMessage = responseData['message'] ?? ' error';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(errorMessage),
        ),
      );
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
