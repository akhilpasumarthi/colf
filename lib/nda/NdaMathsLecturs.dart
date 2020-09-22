import 'package:bvm/nda/video.dart';
import 'package:bvm/services/courses.dart';
import 'package:flutter/material.dart';
import '../Screen/BottomNavigation.dart';

class NdaMathsLecturs extends StatefulWidget {
  final String topicName;
  final id;
  static const routeName = '/NdaMathsLecturs';

  const NdaMathsLecturs({Key key, this.topicName, this.id}) : super(key: key);

  @override
  _NdaMathsLectursState createState() => _NdaMathsLectursState();
}

class _NdaMathsLectursState extends State<NdaMathsLecturs> {
  int _currentindex = 0;
  var topic_data;
  var topics;
  @override
  void initState() {
    topic_data = gettopicdata();
    super.initState();
  }

  gettopicdata() async {
    var data = await getLecturesMedia(widget.id, 0);
    await Future.delayed(Duration(milliseconds: 2000));
    setState(() {
      topics = data;
    });
    print(topics);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
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
      body: SingleChildScrollView(
        child: Container(
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
                        blurRadius: 5.0,
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
                padding: EdgeInsets.only(top: 20.0, left: 10.0),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "lectures of ${widget.topicName}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.545,
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: FutureBuilder(
                          future: topic_data,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(child: Text(snapshot.error));
                            }
                            if (snapshot.hasData) {
                              return (topics["data"]["data"].length == 0)
                                  ? Center(
                                      child: Text("No Lectures found yet!"),
                                    )
                                  : ListView.builder(
                                      physics: ScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: topics["data"]["data"].length,
                                      itemBuilder: (context, index) {
                                        return mediaListView(
                                            index, snapshot.data);
                                      },
                                    );
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 0.0),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         height: 85,
                      //         width: 100,
                      //         child: RaisedButton(
                      //           onPressed: () {},
                      //           elevation: 30.0,
                      //           color: Colors.white,
                      //           child: Icon(
                      //             Icons.play_arrow,
                      //             color: Colors.red,
                      //             size: 40,
                      //           ),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.only(left: 30.0),
                      //         child: RaisedButton(
                      //           onPressed: () {},
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(0.0),
                      //             side: BorderSide(color: Colors.grey[800]),
                      //           ),
                      //           elevation: 5.0,
                      //           color: Colors.white,
                      //           child: Text(
                      //             "Lecture 1",
                      //             style: TextStyle(
                      //               fontSize: 18.0,
                      //               color: Colors.black,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 10.0),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         height: 85,
                      //         width: 100,
                      //         child: RaisedButton(
                      //           onPressed: () {},
                      //           elevation: 30.0,
                      //           color: Colors.white,
                      //           child: Icon(
                      //             Icons.play_arrow,
                      //             color: Colors.red,
                      //             size: 40,
                      //           ),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.only(left: 30.0),
                      //         child: RaisedButton(
                      //           onPressed: () {},
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(0.0),
                      //             side: BorderSide(color: Colors.grey[800]),
                      //           ),
                      //           elevation: 5.0,
                      //           color: Colors.white,
                      //           child: Text(
                      //             "Lecture 2",
                      //             style: TextStyle(
                      //               fontSize: 18.0,
                      //               color: Colors.black,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 15.0),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         height: 85,
                      //         width: 100,
                      //         child: RaisedButton(
                      //           onPressed: () {},
                      //           elevation: 30.0,
                      //           color: Colors.white,
                      //           child: Icon(
                      //             Icons.play_arrow,
                      //             color: Colors.red,
                      //             size: 40,
                      //           ),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.only(left: 30.0),
                      //         child: RaisedButton(
                      //           onPressed: () {},
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(0.0),
                      //             side: BorderSide(color: Colors.grey[800]),
                      //           ),
                      //           elevation: 5.0,
                      //           color: Colors.white,
                      //           child: Text(
                      //             "Lecture 3",
                      //             style: TextStyle(
                      //               fontSize: 18.0,
                      //               color: Colors.black,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 15.0),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         height: 85,
                      //         width: 100,
                      //         child: RaisedButton(
                      //           onPressed: () {},
                      //           elevation: 30.0,
                      //           color: Colors.white,
                      //           child: Icon(
                      //             Icons.play_arrow,
                      //             color: Colors.red,
                      //             size: 40,
                      //           ),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.only(left: 30.0),
                      //         child: RaisedButton(
                      //           onPressed: () {},
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(0.0),
                      //             side: BorderSide(color: Colors.grey[800]),
                      //           ),
                      //           elevation: 5.0,
                      //           color: Colors.white,
                      //           child: Text(
                      //             "Lecture 4",
                      //             style: TextStyle(
                      //               fontSize: 18.0,
                      //               color: Colors.black,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 15.0),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         height: 85,
                      //         width: 100,
                      //         child: RaisedButton(
                      //           onPressed: () {},
                      //           elevation: 30.0,
                      //           color: Colors.white,
                      //           child: Icon(
                      //             Icons.play_arrow,
                      //             color: Colors.red,
                      //             size: 40,
                      //           ),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.only(left: 30.0),
                      //         child: RaisedButton(
                      //           onPressed: () {},
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(0.0),
                      //             side: BorderSide(color: Colors.grey[800]),
                      //           ),
                      //           elevation: 5.0,
                      //           color: Colors.white,
                      //           child: Text(
                      //             "Lecture 5",
                      //             style: TextStyle(
                      //               fontSize: 18.0,
                      //               color: Colors.black,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 15.0, bottom: 20.0),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         height: 85,
                      //         width: 100,
                      //         child: RaisedButton(
                      //           onPressed: () {},
                      //           elevation: 30.0,
                      //           color: Colors.white,
                      //           child: Icon(
                      //             Icons.play_arrow,
                      //             color: Colors.red,
                      //             size: 40,
                      //           ),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.only(left: 30.0),
                      //         child: RaisedButton(
                      //           onPressed: () {},
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(0.0),
                      //             side: BorderSide(color: Colors.grey[800]),
                      //           ),
                      //           elevation: 5.0,
                      //           color: Colors.white,
                      //           child: Text(
                      //             "Lecture 6",
                      //             style: TextStyle(
                      //               fontSize: 18.0,
                      //               color: Colors.black,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
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

  Widget mediaListView(int index, data) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 20.0),
      child: Row(
        children: [
          Container(
            height: 85,
            width: 100,
            child: RaisedButton(
              onPressed: () {
                print('video url:${data["data"]["data"][index]["video_link"]}');
              },
              elevation: 30.0,
              color: Colors.white,
              child: Icon(
                Icons.play_arrow,
                color: Colors.red,
                size: 40,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: RaisedButton(
              onPressed: () {
                print('video url:${data["data"]["data"][index]["video_link"]}');
                Navigator.push(context, MaterialPageRoute(builder: (context)=>video()));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.grey[800]),
              ),
              elevation: 5.0,
              color: Colors.white,
              child: Text(
                data["data"]["data"][index]["title"],
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
