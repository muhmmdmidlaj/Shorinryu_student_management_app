
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// Future<void> loginUser(Map<String, dynamic> data) async {
//   try {
//     var url = Uri.parse('http://10.4.2.41:8000/user/login/');
//     var headers = {
//       'Content-Type': 'application/json',
//     };
//     var jsonData = json.encode(data);

//     var response = await http.post(
//       url,
//       headers: headers,
//       body: jsonData,
//     );

//     if (response.statusCode == 201) {
    
//       // Data posting successful
//       print('success');

//       // Handle the response as needed
//     } else {
//       // Data posting failed
//       // Handle the error
//     }
//   } catch (error) {
//     print(error);
//   }
// }
