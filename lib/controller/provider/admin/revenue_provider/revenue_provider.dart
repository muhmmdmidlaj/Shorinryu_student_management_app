import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorinryu/model/calculate_revenue_model/calculate_revenue_model.dart';
import 'package:shorinryu/model/core/base_url/base_url.dart';
import 'package:shorinryu/model/payment_model/payment_model.dart';

class RevenueProvider extends ChangeNotifier {
  List<Payment> revenue = [];
  Future<List<Payment>> fetchPayment() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessKey = prefs.getString('accessKey');

    final response = await http.get(
      Uri.parse('$baseUrl/user/payment/user_payments/'),
      headers: {
        'Authorization': 'Bearer $accessKey',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      revenue = jsonData.map((item) => Payment.fromJson(item)).toList();
      notifyListeners();
      return revenue;
    } else {
      throw Exception('Failed to load leave requests');
    }
  }

  List<RevenueData> revenueRecord = [];
  Future<void> fetchCalculate(String startDate, String endDate) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessKey = prefs.getString('accessKey');

    final Map<String, dynamic> requestData = {
      'start_date': startDate,
      'end_date': endDate,
    };

    final Uri uri = Uri.parse('$baseUrl/user/attendance/filter/')
        .replace(queryParameters: requestData);

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $accessKey',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      jsonData.forEach((item) {
        final record = RevenueData.fromJson(item);
        revenueRecord.add(record);
      });

      notifyListeners();
    } else {
      throw Exception('Failed to load attendance records');
    }
  }
}
