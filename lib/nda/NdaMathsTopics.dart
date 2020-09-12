import 'package:flutter/material.dart';
import 'NdaMathsLecturs.dart';

class NdaMathsTopics extends StatefulWidget {
  @override
  _NdaMathsTopicsState createState() => _NdaMathsTopicsState();
}

class _NdaMathsTopicsState extends State<NdaMathsTopics> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: BackButton(
     color: Colors.black
   ), 
        backgroundColor: Colors.white,
        elevation: 25.0,
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
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
                "BVM Defence Academy",
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
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  //shape: .circle,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(3.0, 3.0),
                      blurRadius: 3.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                height: 160,
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  children: [
                    Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Image.asset(
                        "assets/images/nda.jpeg",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 35.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lecturs",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: 190.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => NdaMathsLecturs()));
                          },
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 7.0),
                          color: Colors.white,
                          elevation: 30.0,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 14.0),
                                child: Text(
                                  "Topic 1",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 35.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: 190.0,
                        child: RaisedButton(
                          onPressed: () {
                          },
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 7.0),
                          color: Colors.white,
                          elevation: 30.0,
                          child: Row(
                            children: [
                              
                              Padding(
                                padding: EdgeInsets.only(left: 14.0),
                                child: Text(
                                  "Topic 2",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 33.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
       
    );
  }
}