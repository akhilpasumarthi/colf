import 'package:shared_preferences/shared_preferences.dart';


   Future<String> sendtoken( String token ) async{
     final prefs= await SharedPreferences.getInstance();
     prefs.setString('user', token);
     return "added successfully";
   }


  Future<String> gettoken(  ) async{
  final prefs= await SharedPreferences.getInstance();

  return prefs.getString('user');
  }