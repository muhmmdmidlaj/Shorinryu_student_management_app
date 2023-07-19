// import 'dart:convert';
// // import 'dart:html';
// import 'package:http/http.dart' as http;
// import 'package:either_dart/either.dart';
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shorinryu/model/error/error_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> registerUser(Map<String, dynamic> userData) async {
  final String apiUrl =
      'http://10.4.2.41:8000/user/register/'; // Replace with your API endpoint

  // Convert user data to JSON
  final jsonData = json.encode(userData);

  // Send POST request to register the user
  final response = await http.post(Uri.parse(apiUrl), body: jsonData, headers: {
    'Content-Type': 'application/json',
  });

  if (response.statusCode == 200) {
    print('success');
    final responseData = json.decode(response.body);
    final String message = responseData['message'];

    // Registration successful
    print('Registration Successful: $message');
  } else {
    final responseData = json.decode(response.body);
    final String errorMessage = responseData['error'];

    // Registration failed
    print('Registration Failed: $errorMessage');
  }
}



Future<void> loginUser(Map<String, dynamic> loginData) async {
  final String apiUrl = 'http://10.4.2.41:8000/user/login/'; // Replace with your API endpoint

  // Create a map with email and password
  
  // Convert login data to JSON
  final jsonData = json.encode(loginData);

  // Send POST request to login the user
  final response = await http.post(Uri.parse(apiUrl), body: jsonData, headers: {
    'Content-Type': 'application/json',
  });

  if (response.statusCode == 200) {
    print('Success');
    final responseData = json.decode(response.body);
    final String message = responseData['message'];
    final String token = responseData['token'];

    // Login successful
    print('Login Successful: $message');
    print('Token: $token');
  } else {
    final responseData = json.decode(response.body);
    final String errorMessage = responseData['error'];

    // Login failed
    print('Login Failed: $errorMessage');
  }
}




// import '../../precentation/view/core/base_url/base_url.dart';

// class UserAuthFunctions {
//   Future<Either<ErrorModel, String>> registerUser(
//       Map<String, dynamic> data) async {
//     try {
//       final reqst =
//           http.MultipartRequest('POST', Uri.parse("${baseUrl}register/"));

//       // var url = Uri.parse("${baseUrl}register/");
//       // var headers = {'Content-Type': 'application/json'};
//       // var jsonData = json.encode(data);
//       // var response = await http.post(url, headers: headers, body: jsonData);
//       StreamedResponse res = await reqst.send();
//       if (res.statusCode == 201) {
//         var response = await http.Response.fromStream(res);
//         final SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString(
//             'refreshKey', jsonDecode(response.body)['refresh']);
//         await prefs.setString('accessKey', jsonDecode(response.body)['access']);
//         final userData = jsonEncode(jsonDecode(response.body)['user']);
//         await prefs.setString('user', userData);
//         return Right(userData);
//       } else {
//         Response response = await http.Response.fromStream(res);
//         Map<String, dynamic> data = jsonDecode(response.body);
//         if (data.length == 2) {
//           return Left(ErrorModel('Email and Username already exists'));
//         }
//         return Left(ErrorModel(data.values.single.first.toString()));
//       }
//     } catch (e) {
//       return Left(ErrorModel(e.toString()));
//     }
//   }

  // Future<Either<ErrorModel, String>> registerUser(Map<String, dynamic> data) async {
  //   try {
  //     var url = Uri.parse("$baseUrl/register/");
  //     var headers = {'Content-Type': 'application/json'};
  //     var jsonData = json.encode(data);
  //     var response = await http.post(url, headers: headers, body: jsonData);

  //     print('Response status code: ${response.statusCode}');
  //     print('Response body: ${response.body}');

  //     if (response.statusCode == 201) {
  //       final responseData = json.decode(response.body);
  //       final refreshKey = responseData['refresh'];
  //       final accessKey = responseData['access'];
  //       final user = jsonEncode(responseData['user']);

  //       final SharedPreferences prefs = await SharedPreferences.getInstance();
  //       await prefs.setString('refreshKey', refreshKey);
  //       await prefs.setString('accessKey', accessKey);
  //       await prefs.setString('user', user);

  //       return Right(user);
  //     } else {
  //       var errorResponse = jsonDecode(response.body);
  //       dynamic errorMessage = [  errorResponse['email'], errorResponse['name'],errorResponse['password']];

  //       return Left(errorMessage);
  //     }
  //   } catch (e) {
  //     print('An error occurred: $e');
  //     return Left('An error occurred: $e');
  //   }
  // }

//   Future<Either<String, String>> loginUser(Map<String, dynamic> body) async {
//     try {
//       Response response = await http.post(
//         Uri.parse("$baseUrl/login/"),
//         headers: {'Content-Type': 'application/json; charset=UTF-8'},
//         body: json.encode(body),
//       );

//       if (response.statusCode == 200) {
//         final SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString(
//             'refreshKey', jsonDecode(response.body)['refresh']);
//         await prefs.setString('accessKey', jsonDecode(response.body)['access']);
//         final userData = jsonEncode(jsonDecode(response.body)['user']);
//         await prefs.setString('user', userData);
//         return Right(userData);
//       } else {
//         return const Left(
//             'message: Incorrect credentials or user does not exist');
//       }
//     } catch (e) {
//       return Left('An error occurred: $e');
//     }
//   }
// }

