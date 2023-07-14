import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> registerUser(Map<String, dynamic> data) async {
  try {
    var url = Uri.parse('http://10.4.2.41:8000/user/register/');
    var headers = {
      'Content-Type': 'application/json',
    };
    var jsonData = json.encode(data);

    var response = await http.post(
      url,
      headers: headers,
      body: jsonData,
    );

    if (response.statusCode == 201) {
      // Data posting successful
      print('success');

      // Handle the response as needed
    } else {
      // Data posting failed
      // Handle the error
    }
  } catch (error) {
    print(error);
  }
}



Future<bool> checkElevatorButtonClick(String userId) async {
  final apiUrl = 'http://10.4.2.41:8000/user/register/'; // Replace with your actual API URL

  final response = await http.get(Uri.parse('$apiUrl?'));

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    final bool buttonClicked = responseData['buttonClicked'];

    return buttonClicked;
  } else {
    throw Exception('Failed to check elevator button click.');
  }
}
