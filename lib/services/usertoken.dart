import 'package:shared_preferences/shared_preferences.dart';

sendtoken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('user', token);
}


Future<String> gettoken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('user');
}
