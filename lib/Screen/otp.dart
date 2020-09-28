import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bvm/Screen/BottomNavigation.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:bvm/services/usertoken.dart';
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
bool _spincontorller=false;
class _OTpState extends State<Otp> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
 // print(widget.confirmation_password +
 //        widget.firstname +
 //        widget.lastname +
 //        widget.mobile +
 //        widget.password);
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Padding(
                padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.30,
                  width: 250.0,
                  child: SvgPicture.asset("assets/images/otp1.svg"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OTP Verification",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enter the OTP send to your Mobile Number",
                      style: TextStyle(
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
               Padding(
                padding: EdgeInsets.only(top: 20.0, left: 100.0, right: 100.0),
                child: PinFieldAutoFill(
                  codeLength: 4,
                
                  controller: otpController,
                  
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't you get the OTP?",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[800],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        verifyOtp();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: GestureDetector(
                          onTap: (){
                            resendOtp();
                          },
                          child: Text(
                            "Re-send OTP",
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             
              Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  //color: Colors.blue[900],
                  elevation: 0.0,
                  color: Colors.white,
                  padding: EdgeInsets.only(
                      top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
                  onPressed: () {
                    verifyOtp();
                  },
                  child: SvgPicture.asset("assets/images/otp10.svg"),
                ),
              ),
              SpinKitRing(
                color: Colors.blue,
                size: _spincontorller?50:0,
              )
              ,
            ],
          ),
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
    setState(() {
      _spincontorller=!_spincontorller;
    });
    var uri = Uri.parse("https://api.msg91.com/api/v5/otp/verify");
    uri = uri.replace(queryParameters: queryParams);
    var verifyOtpResponse = await http.post(uri);
    var data = jsonDecode(verifyOtpResponse.body);
    if (data['type'] == "success") {
      otpController.clear();
      showToast("Otp verified Succesfully", duration: 3, gravity: Toast.TOP);
      register();
      setState(() {
        _spincontorller=!_spincontorller;
      });
    } else {
      showToast("Error Occured, Try again.", duration: 3, gravity: Toast.TOP);
      Navigator.pop(context);
    }
  }
  void resendOtp() async {
    var queryParams = {
      'mobile': "91" + widget.mobile,
      'authkey': "326864A92hJb2My5ea005a9P1",
    };
    var uri = Uri.parse("https://api.msg91.com/api/v5/otp/retry");
    uri = uri.replace(queryParameters: queryParams);
    var verifyOtpResponse = await http.post(uri);
    var data = jsonDecode(verifyOtpResponse.body);
    if (data['type'] == "success") {
      otpController.clear();
      showToast("Otp resent  Succesfully", duration: 3, gravity: Toast.TOP);
      //register();
    } else {
      showToast("Error Occured, Try again.", duration: 3, gravity: Toast.TOP);
      //Navigator.pop(context);
    }
  }

  void register() async {
   
    String token;
    final response =
        await http.post('https://bilaltech.in/api/public/api/register', body: {
      "first_name": widget.firstname,
      "last_name": widget.lastname,
      "mobile": widget.mobile,
      "password": widget.password,
      "confirm_password": widget.confirmation_password,
      //"token": true,
    });

    var res = jsonDecode(response.body);
    print(response.statusCode);
    if (res["success"] == true) {
      token = res["data"]["token"];
      sendtoken(token);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavigation(),
        ),
      );
      showToast("Thanks for registering .", duration: 4, gravity: Toast.CENTER);
    } else if (res["errors"] == "The mobile has already been taken.") {
      Navigator.pop(context);
      showToast("Mobile Number already registered.",
          duration: 5, gravity: Toast.CENTER);
    } else {
      showToast("Error Occured, Try again.", duration: 5, gravity: Toast.TOP);
      Navigator.pop(context);
    }
  }
}
