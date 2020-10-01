import 'dart:convert';
import 'dart:io';
import 'package:bvm/Screen/EbookScreen.dart';
import 'package:http/http.dart' as http;
import 'package:bvm/Screen/LoginSigninScreen.dart';
import 'package:bvm/Screen/MyCourse.dart';
import 'package:bvm/Screen/MyProfil.dart';
import 'package:share/share.dart';
import 'package:bvm/services/usertoken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/UserScreen';
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String appshareurl = "https://play.google.com/store/apps/details?id=com.bvnschool";
  var userdata;
  String token;
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString('user');
    var response = await http.get(
        'https://bilaltech.in/api/public/api/getAuthUser',
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    if (response.statusCode == 200) {
      setState(() {
        userdata = jsonDecode(response.body);
        print(userdata);
      });
    } else {
      Toast.show("Error Occured Please SignIn Again", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<String> _getint() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', "hi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 0.0),
          child: Column(
            children: [
              Container(
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
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 30.0, bottom: 20.0, left: 20.0),
                        child: Container(
                          height: 60.0,
                          width: 60.0,
                          child: Image.asset("assets/images/img1.PNG"),
                        ),
                      ),
                      Container(
                        //height: 200.0,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30.0, left: 20.0),
                              child: Text(
                                "BVN Academy",
                                style: TextStyle(
                                  fontSize: 28.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 0.0, left: 20.0),
                              child: Text(
                                (userdata != null)
                                    ? (userdata["data"]["first_name"] +
                                        " " +
                                        userdata["data"]["last_name"])
                                    : "Loading...",
                                style: TextStyle(
                                  fontSize: 20.0,
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
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => MyProfil()));
                    },
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          child: SvgPicture.asset("assets/images/user2.svg"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "View My Profile",
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
                          MaterialPageRoute(builder: (ctx) => EbookScreen()));
                    },
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          child: SvgPicture.asset("assets/images/myorder.svg"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "E-Book",
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
                    onPressed: () {
                      sendtoken(null);
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
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
                    onPressed: () {
                      final RenderBox box = context.findRenderObject();
                      Share.share(appshareurl,
                          //subject: ,
                          sharePositionOrigin:
                              box.localToGlobal(Offset.zero) & box.size);
                    },
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
    );
  }
}
