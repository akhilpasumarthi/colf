
import 'package:flutter/material.dart';

class PDFviewer extends StatefulWidget {
  @override
  _PDFviewerState createState() => _PDFviewerState();
}

class _PDFviewerState extends State<PDFviewer> {
  String pdf = "https://bilaltech.in/api/public/storage/uploads/cobra.pdf";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.pink[400],
        elevation: 25.0,
        title: Row(
          children: [
            
            Padding(
              padding: EdgeInsetsDirectional.only(start: 12.0),
              child: Text(
                "BVN Academy",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Text(
                    "All Pdf",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0,left: 30.0),
                    child: Container(
                      child: RaisedButton(onPressed: () {
                         
                      },
                      padding: EdgeInsets.only(top: 5.0,bottom: 5.0,left: 20.0,right: 20.0),
                      elevation: 20.0,
                      color: Colors.white,
                      child: Text("First Pdf",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      ),
                      ),
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
