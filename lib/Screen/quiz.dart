import 'package:bvm/services/courses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  final id;

  const TestScreen({Key key, this.id}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var qsndata, tempData, qsncount;
  final bool loop = false;
  List<bool> checklist = [];
  var colorlist = [];
  Map answerId = {};
  @override
  void initState() {
    qsndata = getdata(widget.id);
    super.initState();
  }

  getdata(var id) async {
    var data = await getTestQsns(id);
    setState(() {
      tempData = data;
      qsncount = tempData['data'].length;
    });
    for (var i = 0; i < qsncount; i++) {
      var x = tempData['data'][i];
      answerId[x['id']] = '';
    }
    for (var i = 0; i < qsncount; i++) {
      colorlist.add([false, false, false, false]);
    }
    print(answerId);
    print(colorlist);
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
                "BVN Defence Academy",
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              FutureBuilder(
                future: qsndata,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return (tempData["data"].length != 0)
                        ? ListView.separated(
                            separatorBuilder: (context, index) {
                              return Container(
                                height: 15,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.transparent,
                              );
                            },
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: tempData["data"].length,
                            itemBuilder: (context, index) {
                              return showquiz(tempData, index);
                            },
                          )
                        : Center(
                            child: Text('No Test Found'),
                          );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              Center(
                child: RaisedButton(
                  onPressed: () async {
                    var x = await getmarks(widget.id, answerId.toString());
                  },
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget showquiz(var tempdata, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${index + 1}. ${tempdata['data'][index]['question']}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      colorlist[index][0] = true;
                      colorlist[index][1] = false;
                      colorlist[index][2] = false;
                      colorlist[index][3] = false;
                      answerId[tempdata['data'][index]['id']] = tempdata['data']
                              [index]['options'][0]['id']
                          .toString();
                    });
                  },
                  color: (colorlist[index][0]) ? Colors.blue : Colors.grey[300],
                  child: Text(
                      tempdata['data'][index]['options'][0]['option_text']),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      colorlist[index][0] = false;
                      colorlist[index][1] = true;
                      colorlist[index][2] = false;
                      colorlist[index][3] = false;
                      answerId[tempdata['data'][index]['id']] = tempdata['data']
                              [index]['options'][1]['id']
                          .toString();
                    });
                  },
                  color: (colorlist[index][1]) ? Colors.blue : Colors.grey[300],
                  child: Text(
                      tempdata['data'][index]['options'][1]['option_text']),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      colorlist[index][0] = false;
                      colorlist[index][1] = false;
                      colorlist[index][2] = true;
                      colorlist[index][3] = false;
                      answerId[tempdata['data'][index]['id']] = tempdata['data']
                              [index]['options'][2]['id']
                          .toString();
                    });
                  },
                  color: (colorlist[index][2]) ? Colors.blue : Colors.grey[300],
                  child: Text(
                      tempdata['data'][index]['options'][2]['option_text']),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      colorlist[index][0] = false;
                      colorlist[index][1] = false;
                      colorlist[index][2] = false;
                      colorlist[index][3] = true;
                      answerId[tempdata['data'][index]['id']] = tempdata['data']
                              [index]['options'][3]['id']
                          .toString();
                    });
                  },
                  color: (colorlist[index][3]) ? Colors.blue : Colors.grey[300],
                  child: Text(
                      tempdata['data'][index]['options'][3]['option_text']),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var col_1 = Colors.grey[300],
      col_2 = Colors.grey[300],
      col_3 = Colors.grey[300],
      col_4 = Colors.grey[300];
  // Widget quizSwiper(var tempdata) {
  //   var count = tempdata["data"].length;
  //
  //   var answerList = [], keyList = [];
  //   for (var i = 0; i < count; i++) {
  //     for (var j = 0; j < 4; j++) {
  //       if (tempdata["data"][i]["options"][j]["correct"] == "1") keyList.add(j);
  //     }
  //   }
  //   return ListView.builder(
  //
  //     physics: ScrollPhysics(),
  //     scrollDirection: Axis.horizontal,
  //     loop: false,
  //     itemCount: count,
  //     itemBuilder: (context, index) {
  //       return Container(
  //         padding: EdgeInsets.symmetric(horizontal: 10),
  //         child: Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               new Text(
  //                 '${index + 1}. ${tempdata["data"][index]["question"]}',
  //                 style: TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.w400,
  //                     color: Colors.black87),
  //               ),
  //               new SizedBox(height: 10),
  //               new Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   RaisedButton(
  //                     color: col_1,
  //                     onPressed: () {
  //                       showanswer(index);
  //                       if (tempdata["data"][index]["options"][0]["correct"] ==
  //                           "1") {
  //                         setState(() {
  //                           col_1 = Colors.green;
  //                         });
  //                       } else {
  //                         setState(() {
  //                           col_1 = Colors.red;
  //                         });
  //                       }
  //                     },
  //                     child: Text(
  //                         tempdata["data"][index]["options"][0]["option_text"]),
  //                   ),
  //                   RaisedButton(
  //                     color: col_2,
  //                     onPressed: () {
  //                       showanswer(index);
  //                       if (tempdata["data"][index]["options"][1]["correct"] ==
  //                           "1") {
  //                         setState(() {
  //                           col_2 = Colors.green;
  //                         });
  //                       }
  //                       else {
  //                         setState(() {
  //                           col_2 = Colors.red;
  //                         });
  //                       }
  //                     },
  //                     child: Text(
  //                         tempdata["data"][index]["options"][1]["option_text"]),
  //                   )
  //                 ],
  //               ),
  //               new SizedBox(height: 10),
  //               new Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   RaisedButton(
  //                     color: col_3,
  //                     onPressed: () {
  //                       showanswer(index);
  //                       if (tempdata["data"][index]["options"][2]["correct"] ==
  //                           "1") {
  //                         setState(() {
  //                           col_3 = Colors.green;
  //                         });
  //                       }
  //                       else {
  //                         setState(() {
  //                           col_3 = Colors.red;
  //                         });
  //                       }
  //                     },
  //                     child: Text(
  //                         tempdata["data"][index]["options"][2]["option_text"]),
  //                   ),
  //                   RaisedButton(
  //                     color: col_4,
  //                     onPressed: () {
  //                       showanswer(index);
  //                       if (tempdata["data"][index]["options"][3]["correct"] ==
  //                           "1") {
  //                         setState(() {
  //                           col_4 = Colors.green;
  //                         });
  //                       }
  //                       else {
  //                         setState(() {
  //                           col_4 = Colors.red;
  //                         });
  //                       }
  //                     },
  //                     child: Text(
  //                         tempdata["data"][index]["options"][3]["option_text"]),
  //                   ),
  //                 ],
  //               ),
  //               new SizedBox(height: 10),
  //               (checklist[index])
  //                   ? Text(
  //                   "Correct Option is: ${tempdata["data"][index]["options"][keyList[index]]["option_text"]}")
  //                   : SizedBox(),
  //               new SizedBox(height: 10),
  //               (checklist[index])
  //                   ? Text(
  //                   "Explaination is: ${tempdata["data"][index]["options"][keyList[index]]["explanation"]}")
  //                   : SizedBox(),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  void showanswer(index) {
    setState(() {
      checklist[index] = true;
      if (index == 0) {
        col_1 = Colors.green;
      } else if (index == 1) {
        col_2 = Colors.green;
      } else if (index == 2) {
        col_3 = Colors.green;
      } else if (index == 3) {
        col_4 = Colors.green;
      }
    });
  }
  // Widget showquiz(int index, var tempdata)
  // {
  //   var count = tempdata["data"].length;

  //   var answerList = [], keyList = [];
  //   for (var i = 0; i < count; i++) {
  //     for (var j = 0; j < 4; j++) {
  //       if (tempdata["data"][i]["options"][j]["correct"] == "1") keyList.add(j);
  //     }
  //   }
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 10),
  //     child: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           new Text(
  //             '${index + 1}. ${tempdata[index]["question"]}',
  //             style: TextStyle(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.w400,
  //                 color: Colors.black87),
  //           ),
  //           new SizedBox(height: 10),
  //           new Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               RaisedButton(
  //                 color: col_1 ,
  //                 onPressed: () {
  //                   showanswer(index);
  //                   if (tempdata[index]["options"][0]["correct"] ==
  //                       "1") {
  //                     setState(() {
  //                       col_1 = Colors.green;
  //                     });
  //                   } else {
  //                     setState(() {
  //                       col_1 = Colors.red;
  //                     });
  //                   }
  //                 },
  //                 child: Text(
  //                     tempdata[index]["options"][0]["option_text"]),
  //               ),
  //               RaisedButton(
  //                 color: col_2,
  //                 onPressed: () {
  //                   showanswer(index);
  //                   if (tempdata[index]["options"][1]["correct"] ==
  //                       "1") {
  //                     setState(() {
  //                       col_2 = Colors.green;
  //                     });
  //                   }
  //                   else {
  //                     setState(() {
  //                       col_2 = Colors.red;
  //                     });
  //                   }
  //                 },
  //                 child: Text(
  //                     tempdata[index]["options"][1]["option_text"]),
  //               )
  //             ],
  //           ),
  //           new SizedBox(height: 10),
  //           new Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               RaisedButton(
  //                 color: col_3,
  //                 onPressed: () {
  //                   showanswer(index);
  //                   if (tempdata[index]["options"][2]["correct"] ==
  //                       "1") {
  //                     setState(() {
  //                       col_3 = Colors.green;
  //                     });
  //                   }
  //                   else {
  //                     setState(() {
  //                       col_3 = Colors.red;
  //                     });
  //                   }
  //                 },
  //                 child: Text(
  //                     tempdata[index]["options"][2]["option_text"]),
  //               ),
  //               RaisedButton(
  //                 color: col_4,
  //                 onPressed: () {
  //                   showanswer(index);
  //                   if (tempdata["data"][index]["options"][3]["correct"] ==
  //                       "1") {
  //                     setState(() {
  //                       col_4 = Colors.green;
  //                     });
  //                   }
  //                   else {
  //                     setState(() {
  //                       col_4 = Colors.red;
  //                     });
  //                   }
  //                 },
  //                 child: Text(
  //                     tempdata[index]["options"][3]["option_text"]),
  //               ),
  //             ],
  //           ),
  //           new SizedBox(height: 10),
  //           (checklist[index])
  //               ? Text(
  //               "Correct Option is: ${tempdata[index]["options"][keyList[index]]["option_text"]}")
  //               : SizedBox(),
  //           new SizedBox(height: 10),
  //           (checklist[index])
  //               ? Text(
  //               "Explaination is: ${tempdata[index]["options"][keyList[index]]["explanation"]}")
  //               : SizedBox(),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
