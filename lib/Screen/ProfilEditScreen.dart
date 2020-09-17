import 'dart:convert';
import 'dart:io';

import 'package:bvm/Screen/MyProfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class ProfilEditScreen extends StatefulWidget {
  var editableData;
  ProfilEditScreen({this.editableData});
  @override
  _ProfilEditScreenState createState() => _ProfilEditScreenState();
}

class _ProfilEditScreenState extends State<ProfilEditScreen> {
  TextEditingController firstName;
  TextEditingController lastName;
  TextEditingController email;
  TextEditingController mobile;
  TextEditingController address;
  TextEditingController state;

  @override
  Widget build(BuildContext context) {
    firstName = new TextEditingController(
        text: widget.editableData["data"]["first_name"]);
    lastName = new TextEditingController(
        text: widget.editableData["data"]["last_name"]);
    email =
        new TextEditingController(text: widget.editableData["data"]["email"]);
    mobile =
        new TextEditingController(text: widget.editableData["data"]["mobile"]);
    address = new TextEditingController();
    state = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        //backgroundColor: Colors.blu,
        title: Text("Edit profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 30.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          shape: CircleBorder(
                              side: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                  style: BorderStyle.solid)),
                          child: Container(
                            height: 90.0,
                            width: 90.0,
                            child: SvgPicture.asset("assets/images/user.svg"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 55.0, left: 45.0),
                          child: MaterialButton(
                            onPressed: () {},
                            shape: CircleBorder(
                                side: BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                    style: BorderStyle.solid)),
                            elevation: 50.0,
                            color: Colors.white,
                            child: Container(
                              // height: 30.0,
                              child:
                                  SvgPicture.asset("assets/images/edit2.svg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Container(
                  height: 50.0,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: TextFormField(
                      controller: firstName,
                      // initialValue: widget.editableData["data"]["first_name"],
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hoverColor: Colors.black,
                        contentPadding: EdgeInsets.only(left: 15.0),
                        prefixIcon: const Icon(
                          Icons.supervised_user_circle,
                          color: Colors.black,
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        hintText: "First Name",
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Container(
                  height: 50.0,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: TextFormField(
                      controller: lastName,
                      // initialValue: widget.editableData["data"]["last_name"],
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hoverColor: Colors.black,
                        contentPadding: EdgeInsets.only(left: 15.0),
                        prefixIcon: const Icon(
                          Icons.supervised_user_circle,
                          color: Colors.black,
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        hintText: "Last Name",
                      ),
                    ),
                  ),
                ),
              ),
              
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Container(
                  height: 50.0,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: TextFormField(
                      // initialValue: widget.editableData["data"]["mobile"],
                      controller: mobile,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hoverColor: Colors.black,
                        contentPadding: EdgeInsets.only(left: 15.0),
                        prefixIcon: const Icon(
                          Icons.mobile_screen_share,
                          color: Colors.black,
                        ),
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
              ),
              
              Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        updatadata();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                      color: Colors.blue[800],
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
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

  updatadata() async {
    String token;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString('user');
    var queryParams = {
      'mobile': mobile.text,
      "first_name": firstName.text,
      "last_name": lastName.text,
    };
    var uri = Uri.parse("https://bilaltech.in/api/public/api/updateAuthUser");
    uri = uri.replace(queryParameters: queryParams);
    var response = await http
        .put(uri, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    Toast.show("update Successfull", context,
        duration: 4, gravity: Toast.CENTER);
    print(jsonDecode(response.body));
    Navigator.pop(context);
    Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (context) {
      return MyProfil();
    }));
  }
}
