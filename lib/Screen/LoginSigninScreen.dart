import 'package:bvm/Screen/BottomNavigation.dart';
import 'package:bvm/Screen/HomeMain.dart';
import 'package:bvm/services/usertoken.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Signin.dart';
import 'SignUp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  TabController tb;
  @override
  void initState() {
    tb = TabController(
      length: 2,
      vsync: this,
    );
    _getint();
    super.initState();
  }

  _getint() async {
    final user = await gettoken();
    print("user is $user");
    if (user != null) {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNavigation()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // title: Text('AppBar'),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 00.0),
                    child: Container(
                      width: 140.0,
                      height: 100.0,
                      child: Image.asset(
                        "assets/images/img1.PNG",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.square(140.0),
            child: TabBar(
              tabs: [
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.blue[800], fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.blue[800], fontSize: 20.0),
                  ),
                ),
              ],
              unselectedLabelColor: Colors.blue[100],
              indicatorColor: Colors.blue[700],
              controller: tb,
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SignUp(),
            Signin(),
          ],
          controller: tb,
        ),
      ),
    );
  }
}
