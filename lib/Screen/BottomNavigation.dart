import 'Defince.dart';
import 'package:bvm/Screen/HomeMain.dart';
import 'package:bvm/Screen/MyCourse.dart';
import 'package:bvm/Screen/SearchScreen.dart';
import 'package:bvm/Screen/EbookScreen.dart';
import 'package:bvm/Screen/UserScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  void initState() {
    super.initState();
  }

  //int _currentindex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final List<Widget> _childern = [
    HomeMain(),
    MyCourse(),
    EbookScreen(),
    SearchScreen(),
    UserScreen(),
  ];
  final HomeMain _homeMain = HomeMain();
  final MyCourse _myCourse = MyCourse();
  final EbookScreen _ebookScreen = EbookScreen();
  final SearchScreen _searchScreen = SearchScreen();
  final UserScreen _userScreen = UserScreen();

  Widget _showpage = HomeMain();

  Widget _pagechooser(int page) {
    switch (page) {
      case 0:
        return _homeMain;
        break;
      case 1:
        return _myCourse;
        break;
      case 2:
        return _ebookScreen;
        break;
      case 3:
        return _searchScreen;
        break;
      case 4:
        return _userScreen;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
          child: Scaffold(
        body: _showpage,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          color: Colors.pink[400],
          backgroundColor: Colors.white,
          height: 50.0,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.subject,
              color: Colors.white,
              size: 25,
            ),
            Icon(
              Icons.library_books,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.search,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.supervised_user_circle,
              size: 25,
              color: Colors.white,
            ),
          ],
          animationDuration: Duration(
            milliseconds: 400,
          ),
          index: 0,
          onTap: (index) {
            setState(() {
              _showpage = _pagechooser(index);
            });
          },
        ),
      ),
    );
  }
  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: new GestureDetector(
                      onTap: () => Navigator.of(context).pop(false),
                      child: Text("NO"),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, bottom: 10.0, right: 20.0),
                    child: new GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => Defence())),
                      child: Text("YES"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ) ??
        false;
  }
}
