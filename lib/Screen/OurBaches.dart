import 'package:flutter/material.dart';
import 'package:bvm/services/courses.dart';

import '../nda/NdaScreen.dart';

class OurBatches extends StatefulWidget {
  @override
  _OurBatchesState createState() => _OurBatchesState();
}

class _OurBatchesState extends State<OurBatches> {
  int _currentindex = 0;
  List batchNameList = [];
  List batchmediumurl = [];
  List batchstartdataurl = [];
  List batchlastdataurl = [];
  var ourbatches;
  var courseData;
  Map courses;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ourbatches = courselist();
  }

  courselist() async {
    Map course1 = await Batches();
    setState(() {
      courses = course1;
      print(courses);
      print(courses['success']);
      courses["data"]["data"].forEach((element) {
        batchNameList.add(element["name"]);
        batchmediumurl.add(element['medium']);
        batchstartdataurl.add(element['start_date']);
        batchlastdataurl.add(element['end_date']);
      });
      print(batchmediumurl);
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
                  padding: EdgeInsetsDirectional.only(top: 17),
                  child: Text(
                    "Our Batches",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * .95,
                  padding: EdgeInsets.only(top: 10.0),
                  child: FutureBuilder(
                      future: ourbatches,
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
      padding: EdgeInsets.only(top: 0.0),
      child: Container(
        //height: 50.0,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          subdata['data']['data'][index]['name'],
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, left: 25.0,right: 5.0),
              child: Row(
                children: [
                  Text(
                    "Medium:",
                    style: TextStyle(fontSize: 18.0),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: medium(index, subdata),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0,  left: 25.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Start Date:",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      subdata['data']['data'][index]['start_date'],
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, left: 25.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "End Date:",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    subdata['data']['data'][index]['end_date'],
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            
            
                  Divider(
                    color: Colors.black,
                  ),
          ],
        ),
      ),
    );
  }

  Widget medium(int index, var data) {
    if (data['data']['data'][index]['medium'] == '0') {
      return Text(
        "Hindi",
        style: TextStyle(
          fontSize: 18.0,
        ),
      );
    }
    if (data['data']['data'][index]['medium'] == '1') {
      return Text(
        "English",
        style: TextStyle(
          fontSize: 18.0,
        ),
      );
    }
  }
}
