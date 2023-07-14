// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future<void> loginUser(String usernameOrEmail, String password) async {
//   try {
//     var url = Uri.parse('https://api.example.com/login');
//     var response = await http.post(url, body: {
//       'email': usernameOrEmail,
//       'password': password,
//     });
//     if (response.statusCode == 200) {
//       // Login successful
//       // Handle the response as needed
//     } else {
//       // Login failed
//       // Handle the error
//     }
//   } catch (e) {
//     print(e);
//   }
// }
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> loginUser(Map<String, dynamic> data) async {
  try {
    var url = Uri.parse('http://10.4.2.41:8000/user/login/');
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
