import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> accessKey() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final accessKey = prefs.getString('accessKey');
  return accessKey;
}
