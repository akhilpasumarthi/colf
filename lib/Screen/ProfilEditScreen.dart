import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilEditScreen extends StatefulWidget {
  @override
  _ProfilEditScreenState createState() => _ProfilEditScreenState();
}

class _ProfilEditScreenState extends State<ProfilEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: BackButton(
     color: Colors.black
   ), 
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
                       shape: CircleBorder(side: BorderSide(width: 2, color: Colors.white, style: BorderStyle.solid)), 
                          child: Container(
                            height: 90.0,
                            width: 90.0,
                            child: SvgPicture.asset("assets/images/user.svg"),
                          ),
                        ),
                       Padding(
                       padding: EdgeInsets.only(top: 55.0,left: 45.0),
                       child: MaterialButton(onPressed: () {},
                       shape: CircleBorder(side: BorderSide(width: 2, color: Colors.white, style: BorderStyle.solid)), 
                       elevation: 50.0,
                       color: Colors.white,
                         child: Container(
                          // height: 30.0,
                           child: SvgPicture.asset("assets/images/edit2.svg"),
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
                      child: TextField(
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
                          hintText: "User Name",
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
                      child: TextField(
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
                            Icons.email,
                            color: Colors.black,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          hintText: "E-mail",
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
                      child: TextField(
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
                  padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: Container(
                    height: 50.0,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: TextField(
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
                            Icons.location_city,
                            color: Colors.black,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          hintText: "Address",
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
                      child: TextField(
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
                            Icons.location_on,
                            color: Colors.black,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          hintText: "State",
                        ),
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
