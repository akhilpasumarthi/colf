
import 'package:bvm/services/courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TestScreen extends StatefulWidget {
  final id;

  const TestScreen({Key key, this.id}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var qsndata, tempData;
  @override
  void initState() {
    qsndata = getdata(widget.id);
    super.initState();
  }

  getdata(var id) async {
    var data = await getTestQsns(id);
    setState(() {
      tempData = data;
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: qsndata,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return (tempData["data"].length != 0)
                  ? Center(
                      child: quizSwiper(tempData),
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
      ),
    );
  }

  Widget quizSwiper(var tempdata) {
    var col_1 = Colors.grey,
        col_2 = Colors.grey,
        col_3 = Colors.grey,
        col_4 = Colors.grey;
    var count = tempdata["data"].length;
    // List answer = [];
    // for (var j = 0; j < count; j++) {
    //   for (var i = 0; i < 4; i++) {
    //     if (tempdata["data"][j]["options"][i]["correct"] == 1.toString()) {
    //       answer[j] = 1;
    //       break;
    //     }
    //   }
    // }
    return Swiper(
      pagination: new SwiperPagination(),
      control: new SwiperControl(),
      physics: ScrollPhysics(),
      scrollDirection: Axis.horizontal,
      loop: false,
      itemCount: count,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Text(
                  '${index + 1}. ${tempdata["data"][index]["question"]}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                ),
                new SizedBox(height: 10),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      color: col_1,
                      onPressed: () {
                        showanswer();
                        if (tempdata["data"][index]["options"][0]["correct"] ==
                            1.toString()) {
                          setState(() {
                            col_1 = Colors.green;
                          });
                        }
                      },
                      child: Text(
                          tempdata["data"][index]["options"][0]["option_text"]),
                    ),
                    RaisedButton(
                      color: col_2,
                      onPressed: () {
                        showanswer();
                        if (tempdata["data"][index]["options"][1]["correct"] ==
                            1.toString()) {
                          setState(() {
                            col_2 = Colors.green;
                          });
                        }
                      },
                      child: Text(
                          tempdata["data"][index]["options"][1]["option_text"]),
                    )
                  ],
                ),
                new SizedBox(height: 10),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      color: col_3,
                      onPressed: () {
                        showanswer();
                        if (tempdata["data"][index]["options"][2]["correct"] ==
                            1.toString()) {
                          setState(() {
                            col_3 = Colors.green;
                          });
                        }
                      },
                      child: Text(
                          tempdata["data"][index]["options"][2]["option_text"]),
                    ),
                    RaisedButton(
                      color: col_4,
                      onPressed: () {
                        showanswer();
                        if (tempdata["data"][index]["options"][2]["correct"] ==
                            1.toString()) {
                          setState(() {
                            col_4 = Colors.green;
                          });
                        }
                      },
                      child: Text(
                          tempdata["data"][index]["options"][3]["option_text"]),
                    ),
                  ],
                ),
                new SizedBox(height: 10),
                new Text("Correct Option is: "),
              ],
            ),
          ),
        );
      },
    );
  }

  void showanswer() {}
}
