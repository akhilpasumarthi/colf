import 'dart:async';
import 'package:bvm/Screen/BottomNavigation.dart';
import 'package:bvm/Screen/HomeMain.dart';
import 'package:bvm/Screen/PasswordForgot.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bvm/Screen/LoginSigninScreen.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/rendering.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class Splesh extends StatefulWidget {
  @override
  _SpleshState createState() => _SpleshState();
}

class _SpleshState extends State<Splesh> {
  double _initial = 0.0;

  void update() {
    Timer.periodic(Duration(milliseconds: 100), (Timer) {
      setState(() {
        _initial = _initial + 0.001;
       
      });
    });
  }
  @override
 void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => LoginScreen()));
    });
  }


  @override
  Widget build(BuildContext context) {
    update();
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 150.0, left: 0.0, right: 0.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 180.0,
                          height: 130.0,
                          child: Image.asset(
                            "assets/images/img1.PNG",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.0, bottom: 15.0),
                          child: Text(
                            "BVN ACADMEY",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 150.0, left: 20.0, right: 20.0),
              child: Container(
                height: 90.0,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 42.0),
                      child: Container(
                      height: 40.0,
                      child: LiquidLinearProgressIndicator(
                      
                        value: _initial, // Defaults to 0.5.
                        valueColor: AlwaysStoppedAnimation(Colors.indigo[800]), // Defaults to the current Theme's accentColor.
                        backgroundColor: Colors
                            .white, // Defaults to the current Theme's backgroundColor.
                        borderColor: Colors.indigo[800],
                        borderWidth: 2.0,
                        borderRadius: 5.0,
                        direction: Axis
                            .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                        //center: Text("Loading..."),
                      ),
                  ),
                    ),
                  Padding(padding: EdgeInsets.only(top: 0.0,bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                      width: 50.0,
                      height: 70.0,
                      child: SvgPicture.asset("assets/images/loading.svg",
                      fit: BoxFit.fill,
                      ) ,
                    ),
                  ],),),
                  ],
                ),
              ),
            ),
            Padding(padding:EdgeInsets.only(top: 5.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Loading....",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
                ),
                ),
            ],) ,
            ),
          ],
        ),
      ),
    );
  }
}
