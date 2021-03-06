import 'package:bvm/Screen/BottomNavigation.dart';
import 'package:bvm/Screen/HomeMain.dart';
import 'package:bvm/Screen/PasswordForgot.dart';
import 'package:bvm/services/usertoken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginSigninScreen.dart';
import 'SignUp.dart';
import 'dart:convert';
import 'HomeMain.dart';
import 'otp.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

List userData;
Map data;
String token;
bool _spincontorller=false;

class _SigninState extends State<Signin> {
  double  sizes=10;
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();


//login code

  Future login() async {

   setState(() {
     _spincontorller=!_spincontorller;
   });
    var response = await http.post('https://bilaltech.in/api/public/api/login',
        body: {"mobile": mobile.text, "password": password.text});
    var msg = json.decode(response.body);
    print(msg['success']);
   setState(() {
     _spincontorller=!_spincontorller;
   });
    if (response.statusCode == 200) {
      if (msg['success'].toString() == "true") {
        token = msg["data"]["token"];
        _getint();
        sendtoken(token);
        print(json.decode(response.body));
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavigation(),
          ),
        );
      } else {
        print(json.decode(response.body));
        showToast("Username and password invalid or contact support!",
            duration: 4, gravity: Toast.CENTER);
      }
    } else {
      Toast.show("Error Occured!,Try again later!", context,duration: 4,gravity: Toast.CENTER);
    }
    //print(msg);
  }

  Future<String> _getint() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', token);
    print(token);
  }
//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 25.0, left: 22.0, right: 22.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Container(
                    height: 50.0,
                    child: TextField(
                      controller: mobile,
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
                        hintText: "Mobile Number",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Container(
                    height: 50.0,
                    child: TextField(
                      controller: password,
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
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 25.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          login();
                        },
                        padding: EdgeInsets.only(
                            left: 40.0, right: 40.0, top: 7.0, bottom: 7.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.indigo[800],
                        child: Text(
                          "SIGN IN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an accont?",
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => LoginScreen()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 3.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => PasswordForgot()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
             SpinKitRing(
        color: Colors.blue,
            size: _spincontorller? 50:0
        ),

        ],
            ),
          ),
        ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
