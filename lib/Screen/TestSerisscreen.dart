import 'package:bvm/Screen/ExamSeriesPage.dart';
import 'package:bvm/services/courses.dart';
import 'package:flutter/material.dart';

class TestSeriesScreen extends StatefulWidget {
  @override
  _TestSeriesScreenState createState() => _TestSeriesScreenState();
}

class _TestSeriesScreenState extends State<TestSeriesScreen> {
  var examData, tempdata;
  @override
  void initState() {
    examData = getdata();
    super.initState();
  }

  getdata() async {
    var data = await getExams();
    setState(() {
      tempdata = data;
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        //shadowColor: Colors.red,
        backgroundColor: Colors.white,
        elevation: 25.0,
        title: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 0.0),
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
              padding: EdgeInsetsDirectional.only(start: 15.0),
              child: Text(
                "BVM Defence Academy",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 30.0),
                child: Text(
                  "Test Series",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder(
                    future: examData,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error),
                        );
                      }
                      if (snapshot.hasData) {
                        return(tempdata["data"]["data"].length!=0)? ListView.builder(
                          physics: ScrollPhysics(),
                          itemCount: tempdata["data"]["data"].length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  top: 15.0, left: 10.0, right: 10.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(new MaterialPageRoute(
                                      builder: (context) {
                                        return ExamSeriesPage(
                                            id: tempdata["data"]["data"][index]
                                                ["id"]);
                                      },
                                    ));
                                  },
                                  padding: EdgeInsets.only(
                                      top: 15.0, bottom: 15.0, left: 10.0),
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          tempdata["data"]["data"][index]
                                              ['title'],
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ):Center(
                                child: Text('No data found!'),
                              );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 1,
              //     child: RaisedButton(
              //       onPressed: () {},
              //       padding:
              //           EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10.0),
              //       color: Colors.white,
              //       child: Row(
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(left: 20.0),
              //             child: Text(
              //               "NDA",
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 1,
              //     child: RaisedButton(
              //       onPressed: () {},
              //       padding:
              //           EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10.0),
              //       color: Colors.white,
              //       child: Row(
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(left: 20.0),
              //             child: Text(
              //               "Air Force (X Group)",
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 1,
              //     child: RaisedButton(
              //       onPressed: () {},
              //       padding:
              //           EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10.0),
              //       color: Colors.white,
              //       child: Row(
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(left: 20.0),
              //             child: Text(
              //               "Air Force (Y Group)",
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 1,
              //     child: RaisedButton(
              //       onPressed: () {},
              //       padding:
              //           EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10.0),
              //       color: Colors.white,
              //       child: Row(
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(left: 20.0),
              //             child: Text(
              //               "Air Force (Y & Y Group)",
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 1,
              //     child: RaisedButton(
              //       onPressed: () {},
              //       padding:
              //           EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10.0),
              //       color: Colors.white,
              //       child: Row(
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(left: 20.0),
              //             child: Text(
              //               "NAVY (AA & SSR)",
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 1,
              //     child: RaisedButton(
              //       onPressed: () {},
              //       padding:
              //           EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10.0),
              //       color: Colors.white,
              //       child: Row(
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(left: 20.0),
              //             child: Text(
              //               "MR",
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 1,
              //     child: RaisedButton(
              //       onPressed: () {},
              //       padding:
              //           EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10.0),
              //       color: Colors.white,
              //       child: Row(
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(left: 20.0),
              //             child: Text(
              //               "ARMY GD",
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 1,
              //     child: RaisedButton(
              //       onPressed: () {},
              //       padding:
              //           EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10.0),
              //       color: Colors.white,
              //       child: Row(
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(left: 20.0),
              //             child: Text(
              //               "Clerk",
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 1,
              //     child: RaisedButton(
              //       onPressed: () {},
              //       padding:
              //           EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10.0),
              //       color: Colors.white,
              //       child: Row(
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(left: 20.0),
              //             child: Text(
              //               "Tech",
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(
              //       top: 15.0, left: 10.0, right: 10.0, bottom: 30.0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 1,
              //     child: RaisedButton(
              //       onPressed: () {},
              //       padding:
              //           EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10.0),
              //       color: Colors.white,
              //       child: Row(
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(left: 20.0),
              //             child: Text(
              //               "Paramilitary Forces",
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
