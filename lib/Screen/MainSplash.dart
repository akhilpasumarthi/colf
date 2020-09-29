import 'package:flutter/material.dart';
import 'Defince.dart';

class MainSplash extends StatefulWidget {
  @override
  _MainSplashState createState() => _MainSplashState();
}

class _MainSplashState extends State<MainSplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Defence()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Container(
                  height: 250.0,
                  width: 360.0,
                  child: Image.asset(
                    "assets/images/splash.PNG",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   Text("PRESENTS BY",
                   style: TextStyle(
                     color: Colors.red,
                     fontSize: 20.0,
                     fontWeight: FontWeight.bold,
                   ),
                   ),
              ],
            ),
            ),
        ],
      ),
    );
  }
}
