import 'dart:ffi';
import 'package:bvm/Screen/HomeMain.dart';
import 'package:toast/toast.dart';
import 'BottomNavigation.dart';
import 'package:bvm/Screen/Signin.dart';
import 'package:flutter/material.dart';
import 'LoginSigninScreen.dart';
import 'package:provider/provider.dart';
import 'auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

enum AuthMode { Signup, Login }

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool verifyButton = false;

  List userdata;
  Map data;

  TextEditingController firstname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  String tokenumber;

//signup code
  String verifylink;
  Future signUp() async {
    if (mobile.text.isEmpty || mobile.text.length > 8) {
      if (password.text == confirmpassword.text) {
        if (password.text.length > 8) {
          if (firstname.text.isNotEmpty) {
            final response = await http
                .post('https://bilaltech.in/api/public/api/register', body: {
              "first_name": firstname.text,
              "last_name": lastname.text,
              "mobile": mobile.text,
              "password": password.text,
              "confirm_password": confirmpassword.text,
              //"token": true,
            });
             Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigation(),
                  ),
                );
                showToast("Thanks for registering .",
                duration: 4, gravity: Toast.CENTER);
            if (response.body.isNotEmpty) {
              var msg = json.decode(response.body);
              if (msg=='true') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeMain(),
                  ),
                );
              }
              print(json.decode(response.body));
            }

            showToast("Thanks for registering .",
                duration: 4, gravity: Toast.CENTER);
          } else {
            showToast("Enter Username and password first",
                duration: 3, gravity: Toast.TOP);
          }
        } else {
          showToast("minimum password atleast 8 character  .",
              duration: 4, gravity: Toast.CENTER);
        }
      } else {
        showToast("password doesn't match .",
            duration: 4, gravity: Toast.CENTER);
      }
    } else {
      showToast("please enter correct Mobile Number .",
          duration: 4, gravity: Toast.CENTER);
    }
    //return 0;
  }

  Future verify(String verifylink) async {
    var response = await http.post(verifylink);
    var link = json.decode(response.body);
    print(link);
    showToast("Thanks for verify! you can log in now",
        duration: 5, gravity: Toast.CENTER);
  }

  String menuValue;

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
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: firstname,
                    decoration: InputDecoration(hintText: 'First Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: lastname,
                    decoration: InputDecoration(hintText: 'Last Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty || value.length < 11) {
                        showToast("Please enter a correct Mobile Number",
                            duration: 3, gravity: Toast.TOP);
                      }
                    },
                    controller: mobile,
                    decoration: InputDecoration(hintText: 'Mobile Number'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return 'password is to short';
                      }
                    },
                    controller: password,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return 'password is to short';
                      }
                    },
                    controller: confirmpassword,
                    decoration: InputDecoration(hintText: 'Confirm Password'),
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
                          setState(() {
                            signUp();
                            firstname.text = "";
                            password.text = "";
                          });
                        },
                        padding: EdgeInsets.only(
                            left: 40.0, right: 40.0, top: 7.0, bottom: 7.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.indigo[800],
                        child: Text(
                          "REGISTER",
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
                  padding: EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "By signin up, you confirm that you have",
                        style: TextStyle(
                          fontSize: 12.0,
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
                        "read and agree to be the",
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
                              "Term and Condition",
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
                        "and",
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
                              "Privacy and Police",
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
                  padding: EdgeInsets.only(top: 55.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) => Signin()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Text(
                              "Sign In",
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
