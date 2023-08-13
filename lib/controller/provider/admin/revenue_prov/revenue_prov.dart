import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminRevenueProvider extends ChangeNotifier {
  final TextEditingController _fromLeavedateInputController =
      TextEditingController();
  TextEditingController get fromdateInputController =>
      _fromLeavedateInputController;

        final TextEditingController _toLeavedateInputController =
      TextEditingController();
  TextEditingController get todateInputController =>
      _toLeavedateInputController;

  String _fromselectedDate = "";

  fromRevenueDateInputProvider() {
    _fromLeavedateInputController.text = _fromselectedDate;
  }

  String get fromselectedDate => _fromselectedDate;

  void fromRevenueUpdateSelectedDate(DateTime pickedDate) {
    // ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      _fromselectedDate = formattedDate;
    } else {
      _fromselectedDate = "Date is not selected";
    }
    _fromLeavedateInputController.text = _fromselectedDate;
    notifyListeners();
  }

  String _toselectedDate = "";

  toRevenueDateInputProvider() {
    _toLeavedateInputController.text = _toselectedDate;
  }

  String get toselectedDate => _toselectedDate;

  void toRevenueUpdateSelectedDate(DateTime pickedDate) {
    // ignore: unnecessary_null_comparison
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      _toselectedDate = formattedDate;
    } else {
      _toselectedDate = "Date is not selected";
    }
    _toLeavedateInputController.text = _toselectedDate;
    notifyListeners();
  }

}
