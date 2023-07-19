import 'dart:convert';
import 'package:http/http.dart' as http;

class ModelPostMethodeClass {
  Future<void> postModel(Map<String, dynamic> data, var url) async {
    final String apiUrl = url; // Replace with your API endpoint

    // Create a map with email and password

    // Convert login data to JSON
    final jsonData = json.encode(data);

    // Send POST request to login the user
    final response =
        await http.post(Uri.parse(apiUrl), body: jsonData, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      print('Success');
      final responseData = json.decode(response.body);
      final String message = responseData['message'];
      final String token = responseData['token'];

      // Login successful
      print(' Successful: $message');
      print('Token: $token');
    } else {
      final responseData = json.decode(response.body);
      final String errorMessage = responseData['error'];

      // Login failed
      print(' Failed: $errorMessage');
    }
  }
}
