import 'dart:convert';
import 'package:http/http.dart' as http;

class ModelPostMethodClass {


Future<void> postLeaveRequest(
    Map<String, dynamic> leaveData, String url, String accessKey) async {
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
}
