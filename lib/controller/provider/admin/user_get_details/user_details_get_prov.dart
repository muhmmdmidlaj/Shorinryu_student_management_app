import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorinryu/model/core/base_url/base_url.dart';
import 'package:shorinryu/model/users_get_model/users_get_model.dart';

class UserGetProvider extends ChangeNotifier {
  List<UsersGetModel> _users = [];
  bool _isFetched = false;

  List<UsersGetModel> get users => _users;

  bool get isFetched => _isFetched;

  Future<void> fetchUsers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessKey = prefs.getString('accessKey');

    if (!_isFetched) {
      final response = await http.get(
        Uri.parse('$baseUrl/user/user/'),
        headers: {
          'Authorization': 'Bearer $accessKey',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        _users =
            responseData.map((json) => UsersGetModel.fromJson(json)).toList();
        _isFetched = true;
        notifyListeners();
      } else {
        throw Exception('Failed to load users');
      }
    }
  }
}
