import 'package:bvm/Screen/UserScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'package:bvm/services/usertoken.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordResset extends StatefulWidget {
  @override
  _ChangePasswordRessetState createState() => _ChangePasswordRessetState();
}

class _ChangePasswordRessetState extends State<ChangePasswordResset> {

  TextEditingController oldpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();


  Future updatapassword() async {  
    var response = await http.post('https://bilaltech.in/api/public/api/updatePassword',
        body: {"old_password": oldpassword.text, "password": newpassword.text});
    var msg = json.decode(response.body);
    print(response.statusCode);
    print(msg['success']);
   setState(() {
     
   });
    if (response.statusCode == 200) {
      if (msg['success'].toString() == "true") {
       
        print(json.decode(response.body));
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserScreen(),
          ),
        );
      } else {
        print(json.decode(response.body));
        showToast("Please Give correct old Password",
            duration: 4, gravity: Toast.CENTER);
      }
    } else {
      Toast.show("UPlease Give correct old Password", context,duration: 4,gravity: Toast.CENTER);
    }
    //print(msg);
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 70.0, left: 0.0, right: 0.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120.0,
                            height: 130.0,
                            child: Image.asset(
                              "assets/images/img1.PNG",
                              fit: BoxFit.fill,
                            ),
                          ),
                          /*Padding(
                            padding: EdgeInsets.only(top: 30.0, bottom: 15.0),
                            child: Text(
                              "BVN ACADMEY",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
                child: Container(
                  height: 50.0,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: TextField(
                      controller: oldpassword,

                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hoverColor: Colors.black,
                        contentPadding: EdgeInsets.only(left: 15.0),
                       
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        hintText: "Old Password",
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                child: Container(
                  height: 50.0,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: TextField(
                      controller: newpassword,

                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hoverColor: Colors.black,
                        contentPadding: EdgeInsets.only(left: 15.0),
                       
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        hintText: "New Password",
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      //elevation: 30.0,
                      onPressed: () { 
                        updatapassword();
                      },
                      padding: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0,right: 20.0),
                      color: Colors.blue[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
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

   void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
