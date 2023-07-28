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

    print(accessKey);

    if (response.statusCode == 201) {
     
     Navigator.pop(context);

      print('Leave request submitted successfully.');
    } else {
      final responseData = json.decode(response.body);
      final String errorMessage = responseData['message'] ?? 'Unknown error';
      print('Failed to submit leave request: $errorMessage');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
