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
  Map courses;
  List url = [];
  DateTime data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    livedata = getliveclasses();
  }

  getliveclasses() async {
    Map course1 = await getliveclasses();
    setState(() {
      livedata = course1;
      //print(course1);
      //print(courses['success']);
      livedata["data"]["data"].forEach((element) {
        courseNameList.add(element["title"]);
        courseimageurl.add(element['course_image']);
        url.add(element['link']);
        data.add(element['start_data_time']);
      });
    });
    return course1;
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
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 50.0,
                  padding: EdgeInsets.only(top: 15.0),
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
                          return ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: livedata['data']["data"].length,
                              itemBuilder: (context, index) {
                                return LiveClassesWidget(index, snapshot.data);
                              });
                        }
                        return Center(
                          child: CircularProgressIndicator(),
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
      padding: EdgeInsets.only(top: 20.0),
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    subdata['data']['data'][index]['start_data_time'],
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
