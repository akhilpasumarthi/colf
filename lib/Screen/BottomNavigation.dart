import 'dart:convert';
import 'dart:io';

import 'package:bvm/Screen/HomeMain.dart';
import 'package:bvm/Screen/MyCourse.dart';
import 'package:bvm/Screen/SearchScreen.dart';
import 'package:bvm/Screen/EbookScreen.dart';
import 'package:bvm/Screen/UserScreen.dart';
import 'package:http/http.dart' as http;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

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
    return Scaffold(
      body: _showpage,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        color: Colors.white,
        backgroundColor: Colors.blue[900],
        height: 50.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 25,
          ),
          Icon(
            Icons.library_books,
            size: 25,
          ),
          Icon(
            Icons.collections_bookmark,
            size: 25,
          ),
          Icon(
            Icons.search,
            size: 25,
          ),
          Icon(
            Icons.supervised_user_circle,
            size: 25,
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
    );
  }
}
