library msg91_sms_otp;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:msg91_sms_otp/msg91_sms_otp.dart';


class otp extends StatefulWidget {
  @override
  _otpState createState() => _otpState();
}

class _otpState extends State<otp> {

  Future<otp> sendotp()async{
   // final http.Response response=await http.get("https://api.msg91.com/api/v5/otp?extra_param={"Param1":"Value1", "Param2":"Value2", "Param3": "Value3"}&authkey=326864A92hJb2My5ea005a9P1&template_id=5f5cd473d83f4279930f5679&mobile=919154327896&invisible=1&otp=OTP to send and verify. If not sent, OTP will be generated.&userip=IPV4 User IP&email=Email ID");
  }
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
