import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorinryu/model/core/base_url/base_url.dart';
import 'dart:convert';

import 'package:shorinryu/model/user_leave_request_model/user_leave_request_model.dart';
// Import User model

class LeaveRequestGetProvider extends ChangeNotifier {
  Future<List<UserLeaveRequestModel>> fetchLeaveRequests() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessKey = prefs.getString('accessKey');

    final response = await http.get(
      Uri.parse('$baseUrl/user/leave-applications/'),
      headers: {
        'Authorization': 'Bearer $accessKey',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData
          .map((item) => UserLeaveRequestModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load leave requests');
    }
  }

  
  Future<void> patchLeaveRequest(
      var applicationId, UserLeaveRequestModel request) async {
    Map<String, dynamic> data = {'is_approved': true};

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessKey = prefs.getString('accessKey');
    final response = await http.patch(
      Uri.parse('$baseUrl/user/leave-applications/$applicationId/'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessKey',
      },
    );

    if (response.statusCode == 200) {
      // Update the isAccepted property
      request.isApproved = true;
      notifyListeners();

      print('success');
    } else {
      print('error');
    }
  }
}
