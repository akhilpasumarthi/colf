import 'dart:convert';
import 'dart:io';
import 'package:toast/toast.dart';
import 'package:bvm/services/usertoken.dart';
import 'package:http/http.dart' as http;

Future<Map> getcourses() async {
  var token = await gettoken();
  var uri = Uri.parse("https://bilaltech.in/api/public/api/getCourses");
  var response = await http
      .post(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  print(response.statusCode);
  Map data = jsonDecode(response.body);
  print(data);
  return data;
}

Future<Map> getCourseSubjects(var id) async {
  var token = await gettoken();
  var uri = Uri.parse(
      "https://bilaltech.in/api/public/api/getCourseSubjects?course_id=$id");
  var response = await http
      .post(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  print(response.statusCode);
  Map data = jsonDecode(response.body);
  print(data);
  return data;
}

Future<Map> getSubjectDetails(var id) async {
  var token = await gettoken();
  var uri = Uri.parse(
      "https://bilaltech.in/api/public/api/getLessons?subject_id=$id");
  var response = await http
      .post(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  print(response.statusCode);

  if (response.statusCode == 200) {
    Map data = jsonDecode(response.body);
    print(data);
    return data;
  }
}

Future<Map> getLecturesMedia(var id, var type) async {
  var token = await gettoken();
  var uri = Uri.parse(
      "https://bilaltech.in/api/public/api/getMedia?topic_id=$id&type=$type");
  var response = await http
      .post(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  print(response.statusCode);
  Map data = jsonDecode(response.body);
  return data;
}

Future<Map> getExams() async {
  var token = await gettoken();
  var uri = Uri.parse("https://bilaltech.in/api/public/api/getExams");
  var response = await http
      .post(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  print(response.statusCode);
  Map data = jsonDecode(response.body);
  return data;
}

Future<Map> getExamSeries(var id) async {
  var token = await gettoken();
  var uri = Uri.parse(
      "https://bilaltech.in/api/public/api/getExamSeries?exam_id=$id");
  var response = await http
      .post(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  print(response.statusCode);
  Map data = jsonDecode(response.body);
  print(data);
  return data;
}

Future<Map> getExamSeriesTest(var id) async {
  var token = await gettoken();
  var uri = Uri.parse(
      "https://bilaltech.in/api/public/api/getTest?exam_test_series_id=$id");
  var response = await http
      .post(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  print(response.statusCode);

  Map data = jsonDecode(response.body);
  print(data);
  return data;
}

Future<Map> getTestQsns(var id) async {
  var token = await gettoken();
  var uri =
      Uri.parse("https://bilaltech.in/api/public/api/getQuestions?test_id=$id");
  var response = await http
      .post(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  print(response.statusCode);

  Map data = jsonDecode(response.body);
  print(data);
  return data;
}

Future<Map> orderRequest(
    var id, var price, var payment_id, var payment_type, var type) async {
  var token = await gettoken();
  var uri = Uri.parse(
      "https://bilaltech.in/api/public/api/createOrder?item_id=$id&price=$price&type=$type&transaction_id=$payment_id&payment_type=$payment_type");
  var response = await http
      .post(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

  print(response.statusCode);
  Map data = jsonDecode(response.body);
  return data;
}

Future<Map> getPaidTests() async {
  var token = await gettoken();
  var uri = Uri.parse("https://bilaltech.in/api/public/api/getPurchasedTest");
  var response = await http
      .post(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  // print(response.statusCode);
  Map data = jsonDecode(response.body);
  // print(data);
  return data;
}

Future<Map> getPurchasedCourses() async {
  var token = await gettoken();
  var uri =
      Uri.parse("https://bilaltech.in/api/public/api/getPurchasedCourses");
  var response = await http
      .post(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  print(response.statusCode);
  Map data = jsonDecode(response.body);

  //print(data);

  return data;
}

Future<Map> getmarks(var id, var questions) async {
  print(questions);
  print(id);
  var token = await gettoken();
  print(id);
  var list=['a','b'];
  print(list.runtimeType);
  print((questions).runtimeType);
  var response = await http.post(
      "https://bilaltech.in/api/public/api/testResult",
      headers: {HttpHeaders.authorizationHeader: "Bearer $token",HttpHeaders.contentTypeHeader:"application/json"},body: jsonEncode({
    "test_id": id.toString(), "questions": questions
  }),
  );
  print(response.statusCode);
  Map data = jsonDecode(response.body);
  print(data);
  return data;
}
Future<Map>getfrontdata()async {
  var token=await gettoken();
  var uri =
  Uri.parse("https://bilaltech.in/api/public/api/getFrontData");
  var response = await http
      .post(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
  print(response.statusCode);
  Map data = jsonDecode(response.body);

  print(data);

  return data;
}