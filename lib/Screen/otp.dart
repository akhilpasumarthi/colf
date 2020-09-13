import 'dart:convert';

import 'package:bvm/Screen/BottomNavigation.dart';
import 'package:bvm/Screen/HomeMain.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Otp extends StatefulWidget {
  final String mobile;
  final String firstname;
  final String lastname;
  final String password;
  final String confirmation_password;

  Otp(
      {this.mobile,
      this.firstname,
      this.lastname,
      this.password,
      this.confirmation_password});
  @override
  _OTpState createState() => _OTpState();
}

class _OTpState extends State<Otp> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Container(
                  height: 50.0,
                  child: TextField(
                    controller: otpController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hoverColor: Colors.black,
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      hintText: "Enter the otp",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                onPressed: () {
                  verifyOtp();
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  void verifyOtp() async {
    var queryParams = {
      'mobile': "91" + widget.mobile,
      'otp': '${otpController.text}',
      'authkey': "326864A92hJb2My5ea005a9P1",
    };
    var uri = Uri.parse("https://api.msg91.com/api/v5/otp/verify");
    uri = uri.replace(queryParameters: queryParams);
    var verifyOtpResponse = await http.post(uri);
    var data = jsonDecode(verifyOtpResponse.body);
    if (data['type'] == "success") {
      otpController.clear();
      showToast("Otp verified Succesfully", duration: 3, gravity: Toast.TOP);
      register();
    } else {
      showToast("Error Occured, Try again.", duration: 3, gravity: Toast.TOP);
      Navigator.pop(context);
    }
  }

  void register() async {
    final response =
        await http.post('https://bilaltech.in/api/public/api/register', body: {
      "first_name": widget.firstname,
      "last_name": widget.lastname,
      "mobile": widget.mobile,
      "password": widget.password,
      "confirm_password": widget.confirmation_password,
      //"token": true,
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BottomNavigation(),
      ),
    );
    showToast("Thanks for registering .", duration: 4, gravity: Toast.CENTER);
    if (response.body.isNotEmpty) {
      var msg = json.decode(response.body);
      if (msg == 'true') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeMain(),
          ),
        );
      }
      print(json.decode(response.body));
    }

    showToast("Thanks for registering .", duration: 4, gravity: Toast.CENTER);
  }
}
