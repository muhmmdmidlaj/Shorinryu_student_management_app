import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> postLeaveRequest(Map<String, dynamic> leaveData, String url,
    String accessKey, context) async {
  final jsonData = json.encode(leaveData);

  try {
    final response = await http.post(
      Uri.parse(url),
      body: jsonData,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessKey',
      },
    );

    if (response.statusCode == 201) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Leave Request Submited'),
        ),
      );

      print('Leave request submitted successfully.');
    } else {
      final responseData = json.decode(response.body);
      final String errorMessage = responseData['message'] ?? ' error';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(errorMessage),
        ),
      );
    }
  } catch (e) {
    print(e);
  }
}
