import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:bvm/Screen/BottomNavigation.dart';
import 'package:bvm/Screen/ProfilEditScreen.dart';
import 'package:bvm/Screen/UserScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'MyCourse.dart';

class MyProfil extends StatefulWidget {
  final user_details;
  MyProfil({this.user_details});
  @override
  _MyProfilState createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 0.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 110.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.0, left: 0.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 35.0, bottom: 20.0, left: 00.0),
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: SvgPicture.asset("assets/images/user.svg"),
                        ),
                      ),
                      Container(
                        //height: 200.0,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 40.0, left: 10.0),
                              child: Text(
                                widget.user_details["data"]["first_name"],
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: EdgeInsets.only(top: 0.0, left: 10.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    size: 14.0,
                                  ),
                                  Text(
                                    widget.user_details["data"]["mobile"],
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50.0, top: 18.0),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => ProfilEditScreen()));
                          },
                          shape: CircleBorder(
                              side: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                  style: BorderStyle.solid)),
                          elevation: 0.0,
                          padding: EdgeInsets.only(
                              top: 10.0, right: 10.0, bottom: 10.0, left: 10.0),
                          color: Colors.white,
                          child: SvgPicture.asset("assets/images/edit.svg"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: RaisedButton(
                    onPressed: () {},
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          child: SvgPicture.asset("assets/images/test.svg"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Test Series",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: RaisedButton(
                    onPressed: () {},
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          child: SvgPicture.asset("assets/images/password.svg"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Change Password",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => MyCourse()));
                    },
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          child: SvgPicture.asset("assets/images/courses.svg"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "My Courses",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: RaisedButton(
                    onPressed: () {},
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          child: SvgPicture.asset("assets/images/setting.svg"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Setting",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: RaisedButton(
                    onPressed: () {},
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                          size: 40.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: RaisedButton(
                    onPressed: () {},
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          child: SvgPicture.asset("assets/images/share.svg"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Share App",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavigation(),
    );
  }
}
