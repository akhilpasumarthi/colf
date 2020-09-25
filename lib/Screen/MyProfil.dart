import 'dart:convert';
import 'dart:io';
import 'package:bvm/services/usertoken.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bvm/Screen/ChangePassword.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:bvm/Screen/ProfilEditScreen.dart';
import 'package:bvm/Screen/UserScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'LoginSigninScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'MyCourse.dart';
import 'TestSerisscreen.dart';

class MyProfil extends StatefulWidget {
  @override
  _MyProfilState createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {
  String appshareurl =
      "https://play.google.com/store/apps/details?id=com.bvnschool";

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 0.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 130.0,
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
                        width: MediaQuery.of(context).size.width * 0.45,
                        //height: 200.0,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 50.0, left: 10.0),
                              child: Text(
                                (userdata != null)
                                    ? (userdata["data"]["first_name"] +
                                        " " +
                                        userdata["data"]["last_name"])
                                    : "Loading...",
                                style: TextStyle(
                                  fontSize: 18.0,
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
                                    (userdata != null)
                                        ? userdata["data"]["mobile"]
                                        : "Loading...",
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
                        padding: EdgeInsets.only(top: 18.0),
                        child: RaisedButton(
                          onPressed: () {
                            (userdata != null)
                                ? {
                                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => ProfilEditScreen(editableData: userdata,))),
                                  }
                                : null;
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
                    onPressed: () {
                       Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TestSeriesScreen()));
                    },
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => ChangePassword()));
                    },
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
      //bottomNavigationBar: BottomNavigation(),
    );
  }
//logout

}
