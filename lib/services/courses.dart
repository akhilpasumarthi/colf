import 'dart:convert';
import 'dart:io';

import 'package:bvm/services/usertoken.dart';
import 'package:http/http.dart' as http;

Future<Map> getcourses() async {
  var token = await gettoken();
  var uri = Uri.parse("https://bilaltech.in/api/public/api/getCourses");
  var response = await http
      .post(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  print(response.statusCode);
  Map data = jsonDecode(response.body);
  return data;
}

Future<Map> getCourseSubjects(var id) async {
  var token = await gettoken();
  var uri = Uri.parse("https://bilaltech.in/api/public/api/getCourseSubjects?course_id=$id");
  var response = await http
      .post(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  print(response.statusCode);
  Map data = jsonDecode(response.body);
  return data;
}
