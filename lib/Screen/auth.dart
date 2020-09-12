import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';

class auth with ChangeNotifier {
  String _token;
  DateTime _expiredate;
  String _userid;

  Future<Void> signup(
      String firstname, String lastname, String mobile, String password) async {
    var  url = "https://bilaltech.in/api/public/api/register";
    final Response = await http.post(
      url,
      body: json.encode(
        {
          'first_name': firstname,
          'last_name': lastname,
          'mobile': mobile,
          'password': password,
          //'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(Response.body));
  }
}
