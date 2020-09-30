


import 'package:bvm/nda/NdaBuyScreen.dart';
import 'package:bvm/services/courses.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NdaScreenAllCourses extends StatefulWidget {
  final coursedata;
  static const routeName = '/NdaScreenAllCourses';

  const NdaScreenAllCourses({Key key, this.coursedata}) : super(key: key);
  @override
  _NdaScreenAllCoursesState createState() => _NdaScreenAllCoursesState();
}

class _NdaScreenAllCoursesState extends State<NdaScreenAllCourses> {
  var subjectsData;
  var subjects;
  List courseimageurl = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subjectsData = getsubDetails();
  }
  getsubDetails() async {
    print(widget.coursedata["id"]);

    var data = await getCourseSubjects(widget.coursedata["id"]);
    await Future.delayed(Duration(milliseconds: 1500));

    setState(() {
      subjects = data;
    });
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        //shadowColor: Colors.red,
        backgroundColor: Colors.pink[400],
        elevation: 25.0,
        title: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
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
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white,
                      //shape: .circle,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ),
                      ]),
                  height: 170,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width * 1,
                        child: CachedNetworkImage(
                          imageUrl: widget.coursedata['course_image'],
                          fit: BoxFit.fill,
                          placeholder: (context, url) => Container(
                              height: 30.0,
                              width: 30.0,
                              child: CircularProgressIndicator()),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          widget.coursedata["title"],
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(
                                "Subjects",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: FutureBuilder(
                                future: subjectsData,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return (subjects["data"]["data"].length ==
                                        0)
                                        ? Center(
                                      child:
                                      Text("No subjects found yet!"),
                                    )
                                        : ListView.builder(
                                      physics: ScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                      subjects["data"]["data"].length,
                                      itemBuilder: (context, index) {
                                        return subjectListWidget(
                                            index, snapshot.data);
                                      },
                                    );
                                  }
                                  return Center(
                                      child: CircularProgressIndicator());
                                },
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.only(left: 10.0, top: 22.0),
                                    child: RaisedButton(
                                      color: Colors.indigo[800],
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) => NdaBuyScreen(
                                                  amount: num.parse(widget
                                                      .coursedata["price"]),courseid: widget.coursedata["id"],
                                                )));
                                      },
                                      child: Text(
                                        "Buy Now",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.0,
                                            left: 13.0,
                                            bottom: 60.0),
                                        child: Row(
                                          children: [
                                            Text.rich(
                                              TextSpan(
                                                children: <TextSpan>[
                                                  new TextSpan(
                                                    text:
                                                    '\₹${widget.coursedata["old_price"]}',
                                                    style: new TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.black,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 10.0),
                                              child: Text(
                                                '\₹${widget.coursedata["price"]}',
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavigation(),
    );
  }
  Widget subjectListWidget(int index, var subData) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (ctx) => NdaMathsScreen(
          //               subject_name: subData["data"]["data"][index]
          //                   ["subject_name"],
          //               id: subData["data"]["data"][index]["id"],
          //             )));
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (ctx) => NdaMathsTopics(
          //           data: subData["data"]["data"][index],
          //           subject_name: subData["data"]["data"][index]
          //           ["subject_name"],
          //           id: subData["data"]["data"][index]["id"],
          //         )));

          //writetoasthere
        },
        color: Colors.white,
        child: Container(
          height: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  width: 130,
                  //height: 105,
                  child: CachedNetworkImage(
                    imageUrl: subData["data"]["data"][index]["image"],
                    placeholder: (context, url) => CircularProgressIndicator(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, top: 0.0),
                child: Container(
                  //height: 70,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subData["data"]["data"][index]["subject_name"],
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
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
    );
  }
}
