import 'dart:ffi';
import 'package:bvm/Screen/HomeMain.dart';
import 'package:bvm/Screen/otp.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
        if (password.text.length >= 8) {
          if (firstname.text.isNotEmpty) {
            var queryParams = {
              'authkey': "326864A92hJb2My5ea005a9P1",
              'templateid': "5f5cd473d83f4279930f5679",
              'mobile': "91" + mobile.text
            };
            var uri = Uri.parse("https://api.msg91.com/api/v5/otp");
            uri = uri.replace(queryParameters: queryParams);

            print(uri);
            var otp_response = await http.get(uri);
            var data = json.decode(otp_response.body);
            if (data['type'] == "success") {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Otp(
                    mobile: mobile.text,
                    firstname: firstname.text,
                    lastname: lastname.text,
                    password: password.text,
                    confirmation_password: confirmpassword.text,
                  );
                },
              ));
            }
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
                          signUp();
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
