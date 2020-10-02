import 'package:flutter/material.dart';


class BuyTestScreen extends StatefulWidget {
  @override
  _BuyTestScreenState createState() => _BuyTestScreenState();
}

class _BuyTestScreenState extends State<BuyTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         leading: BackButton(
     color: Colors.white
   ), 
        backgroundColor: Colors.pink[400],
        elevation: 25.0,
        title: Row(
         //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            Padding(
              padding: EdgeInsetsDirectional.only(start: 12.0),
              child: Text(
                "BVN ACADMEY",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
               Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 25.0),
              child: Text("My Test Series",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
              ),
              ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}