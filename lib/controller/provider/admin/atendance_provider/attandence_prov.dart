import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:shorinryu/view/admin/attendence/attendence_mark.dart';
// import 'package:provider/provider.dart';

class AttandenceState extends ChangeNotifier {
  List<CheckboxState> _users = List.generate(10, (_) => CheckboxState());

  List<CheckboxState> get users => _users;
  Map<int, bool> _checkboxStates = {};
  void updateValue(int index, bool newValue) {
    _users[index].value = newValue;
    notifyListeners();
  }

  Future<void> postAttendanceData(Map<String, dynamic> data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessKey = await prefs.getString('accessKey');

    final response = await http.post(
      Uri.parse('http://10.4.5.121:8000/user/attendance/mark_attendance_bulk/'),
      body: jsonEncode(data), // Serialize the data to JSON
      headers: {
        'Authorization': 'Bearer $accessKey',
      },
    );

    if (response.statusCode == 200) {
      print('Attendance data posted successfully');
    } else {
      print('Failed to post attendance data');
    }
  }

  Map<int, CheckboxState> getAllCheckboxStates() {
    return Map.from(_checkboxStates);
  }
}
