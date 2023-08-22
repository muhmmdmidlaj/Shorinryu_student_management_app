import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorinryu/controller/api/leave_application_api/leave_apply.dart';
import 'package:shorinryu/model/core/base_url/base_url.dart';

class LeaveApplyProvider extends ChangeNotifier {
//  final TextEditingController leaveStartController = TextEditingController();
// final  TextEditingController leaveEndController = TextEditingController();
  final TextEditingController leaveResonController = TextEditingController();
  final TextEditingController _startLeavedateInputController =
      TextEditingController();
  TextEditingController get startdateInputController =>
      _startLeavedateInputController;
  final TextEditingController _endLeavedateInputController =
      TextEditingController();
  TextEditingController get enddateInputController =>
      _endLeavedateInputController;

  Future<void> leaveSubmitForm(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('userId').toString();
    final accessKey = prefs.getString('accessKey').toString();

    Map<String, dynamic> leaveApplyData = {
      'user': id,
      'start': startdateInputController.text,
      'end': enddateInputController.text,
      'reasone': leaveResonController.text.toString(),
    };
    var url = '$baseUrl/user/leave-applications/';
    // ModelPostMethodClass leavemodl = ModelPostMethodClass();
    await postLeaveRequest(leaveApplyData, url, accessKey, context);
  }

  cleanSubmitData() async {
    startdateInputController.clear();
    enddateInputController.clear();
    leaveResonController.clear();
  }

  String _startselectedDate = "";

  startLeaveDateInputProvider() {
    _startLeavedateInputController.text = _startselectedDate;
  }

  String get startselectedDate => _startselectedDate;

  void leveStartUpdateSelectedDate(DateTime pickedDate) {
    // ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      _startselectedDate = formattedDate;
    } else {
      _startselectedDate = "Date is not selected";
    }
    _startLeavedateInputController.text = _startselectedDate;
    notifyListeners();
  }

  String _endselectedDate = "";

  endLeaveDateInputProvider() {
    _startLeavedateInputController.text = _endselectedDate;
  }

  String get endselectedDate => _endselectedDate;

  void leveEndUpdateSelectedDate(DateTime pickedDate) {
    // ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      _endselectedDate = formattedDate;
    } else {
      _endselectedDate = "Date is not selected";
    }
    _endLeavedateInputController.text = _endselectedDate;
    notifyListeners();
  }

  leaveStatus(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final leaveStatus = pref.getString('LeaveStatus');

    return leaveStatus;
  }
}
