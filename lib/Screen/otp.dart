
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class otp extends StatefulWidget {
  @override
  _otpState createState() => _otpState();
}

class _otpState extends State<otp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: RaisedButton(
        onPressed: () {
          //otplogin();
        },
    textColor: Colors.white,
    ),
      )

    );
  }
}
