import 'dart:ffi';
import 'otp.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:bvm/Screen/LoginSigninScreen.dart';
import 'package:bvm/Screen/Otp.dart';
import 'package:bvm/Screen/Splesh.dart';
import 'package:bvm/Screen/otp.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Defence extends StatefulWidget {
  Defence({Key key}) : super(key: key);
  final String tital = "lunch url";

  @override
  _DefenceState createState() => _DefenceState();
}

class _DefenceState extends State<Defence> {
//
  Future<void> _lunched;
  String phonenumber = "";
  String _url = "https://play.google.com/store/apps/details?id=com.bvnschool";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 90.0, left: 0.0, right: 0.0),
                    child: RaisedButton(
                      elevation: 0.0,
                      padding:
                          EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                      color: Colors.white24,
                      onPressed: () {
                        _launchURL();
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 120.0,
                              height: 120.0,
                              child: Image.asset(
                                "assets/images/bvm.PNG",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                              child: RaisedButton(
                                color: Colors.blue[600],
                                onPressed: () {
                                  _launchURL();
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  "BVN SR SEC SCHOOL",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
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
              Padding(
                padding: EdgeInsets.only(top:70.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 60.0, left: 0.0, right: 0.0),
                      child: RaisedButton(
                        elevation: 0.0,
                        padding: EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0),
                        color: Colors.white24,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => Splesh()));
                        },
                        child: Container(
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 120.0,
                                height: 120.0,
                                child: Image.asset(
                                  "assets/images/img1.PNG",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                                child: RaisedButton(
                                  color: Colors.blue[600],
                                  onPressed: () {
                                    Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => Splesh()));
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Text(
                                    "BVN DEFENCE ACADMEY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    ),
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
             
            ],
          ),
        ),
      ),
    );
  }

 
_launchURL() async {
  const url = 'https://play.google.com/store/apps/details?id=com.bvnschool';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
}
