import 'package:bvm/Screen/HomeMain.dart';
import 'package:flutter/material.dart';
import 'LoginSigninScreen.dart';
import 'SignUp.dart';
import 'dart:convert';
import 'HomeMain.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

List userData;
Map data;

class _SigninState extends State<Signin> {
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();

//login code

  Future login() async {
    var response = await http.post('https://bilaltech.in/api/public/api/login',
        body: {"mobile": mobile.text, "password": password.text});
    var msg = json.decode(response.body);
    if (msg == "true") {
      print(json.decode(response.body));
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeMain(),
        ),
      );
    } else {
      print(json.decode(response.body));
      showToast("Username and password invalid or contact support!",
          duration: 4, gravity: Toast.CENTER);
    }
    //print(msg);
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
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.0),
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Text(
                              "Change Password",
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
