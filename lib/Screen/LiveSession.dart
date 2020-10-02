import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:bvm/services/courses.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LiveSession extends StatefulWidget {
  @override
  _LiveSessionState createState() => _LiveSessionState();
}

class _LiveSessionState extends State<LiveSession> {
  int _currentindex = 0;
  List courseNameList = [];
  List courseimageurl = [];
  var livedata;
  var courseData;

  Map courses;
  List url = [];
  List coursedataurl=[];
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    livedata = courselist();
  }

  courselist() async {
    Map course1 = await getliveclasses();

    setState(() {
      courses = course1;
      print(courses);
      //print(courses['success']);
      courses["data"]["data"].forEach((element) {
        courseNameList.add(element["title"]);
        courseimageurl.add(element['link']);
        coursedataurl.add(element['start_date_time']);

      });
      print(coursedataurl);
      print(courseNameList);
      print(courseimageurl);
          });
    return courses;
  
  }

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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 20, bottom: 5.0),
                  child: Text(
                    "Live Classes",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
             Divider(
                  color: Colors.black,
                ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * .95,

                  padding: EdgeInsets.only(top: 10.0),
                  child: FutureBuilder(
                      future: livedata,
                      builder: (context, snapshot) {
                        //print(snapshot.data);
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        if (snapshot.hasData) {
                        print(snapshot.data);

                          return ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: courses['data']["data"].length,
                              itemBuilder: (context, index) {
                                return LiveClassesWidget(index, snapshot.data);
                              });
                        }
                        return Center(
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            child: CircularProgressIndicator()),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget LiveClassesWidget(int index, var subdata) {
    return Padding(
      padding: EdgeInsets.only(top: 4.0),
      child: Container(
        //height: 50.0,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*.70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          subdata['data']['data'][index]['title'],
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        ],
                      ),
                    ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 11.0),
                  child: RaisedButton(
                    color: Colors.indigo[800],
                    onPressed: () {
                      _launchURL(index,subdata);
                    },
                    child: Text("Join Me",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 7.0,bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text(
                 subdata['data']['data'][index]['start_date_time'],
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                 ),
                ],
              ),
            ),
             Divider(
                  color: Colors.black,
                )
          ],
        ),
        
      ),
    );
  }



  _launchURL(int index, var data) async {
     var url = data["data"]["data"][index]["link"];
            print('video url:${data["data"]["data"][index]["link"]}');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
