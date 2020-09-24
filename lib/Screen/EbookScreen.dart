import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EbookScreen extends StatefulWidget {
  static const routeName = '/EbookScreen';

  @override
  _EbookScreenState createState() => _EbookScreenState();
}

class _EbookScreenState extends State<EbookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         leading: BackButton(
     color: Colors.black
   ), 
        backgroundColor: Colors.white,
        elevation: 25.0,
        title: Row(
         //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Container(
                width: 35.0,
                height: 35.0,
                child: Image.asset(
                  "assets/images/img1.PNG",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 12.0),
              child: Text(
                "BVN Defence Academy",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 25.0),
              child: Text("E-Book",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
              ),
              ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Container(
                height: 250.0,
                width: 250.0,
                child: SvgPicture.asset("assets/images/error.svg"),
              ),
            ),
           Padding(padding: EdgeInsets.only(top: 10.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Oops! Currently there is no ebook to read",
               style: TextStyle(
                 fontSize: 20.0,
                 fontFamily: 'Montserrat-Light',
                 color: Colors.black,
               ),
               ),
             ],
           ),
           ), 
          ],
        ),
      ),
    );
  }
}
