import 'package:bvm/Nda/NdaMathsLecturs.dart';
import 'package:bvm/Screen/BottomNavigation.dart';
import 'package:bvm/Screen/HomeMain.dart';
import 'package:bvm/Screen/LoginSigninScreen.dart';
import 'package:bvm/Screen/UserScreen.dart';
import 'package:bvm/nda/NdaMathsNotesScreen.dart';
import 'package:bvm/nda/NdaPhysicsLactures.dart';
import 'package:bvm/nda/NdaPhysicsNotes.dart';
import './nda/NdaPhysicsScreen.dart';
import 'package:flutter/material.dart';
import './Nda/ndaScreen.dart';
import './Nda/NdaMathsScreen.dart';
import './screen/MoreCourseScreen.dart';
import './screen/FeaturesScreen.dart';
import 'Screen/Defince.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bvm School",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.red,
        ),

        //primarySwatch: Colors.blue,
        fontFamily: 'Montserrat-Light',
        //appBarTheme: AppBarTheme(color: Colors.black87),
      ),
      home: Defence(),
      routes: {
        MoreCourseScreen.routeName: (context) => MoreCourseScreen(),
        FeaturesScreen.routeName: (context) => FeaturesScreen(),
        NdaScreen.routeName: (context) => NdaScreen(),
        NdaMathsScreen.routeName: (context) => NdaMathsScreen(),
        NdaMathsLecturs.routeName: (context) => NdaMathsLecturs(),
        NdaNotesScreen.routeName: (context) => NdaNotesScreen(),
        NdaPhysicsScreen.routeName: (context) => NdaPhysicsScreen(),
        NdaPhysicsNotes.routeName: (context) => NdaPhysicsNotes(),
        NdaPhysicsLactues.routeName: (context) => NdaPhysicsLactues(),
        UserScreen.routeName: (context) => UserScreen(),
      },
    );
  }
}
