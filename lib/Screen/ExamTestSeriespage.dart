import 'package:bvm/Screen/TestScreen.dart';
import 'package:bvm/services/courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ExamTestSeriesPage extends StatefulWidget {
  final id;

  const ExamTestSeriesPage({Key key, this.id}) : super(key: key);
  @override
  _ExamTestSeriesPageState createState() => _ExamTestSeriesPageState();
}

class _ExamTestSeriesPageState extends State<ExamTestSeriesPage> {
  var testSeriesData, tempData;
  @override
  void initState() {
    testSeriesData = getdata(widget.id);
    super.initState();
  }

  getdata(var id) async {
    var data = await getExamSeriesTest(id);
    setState(() {
      tempData = data;
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
              padding: EdgeInsetsDirectional.only(start: 15.0),
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
        physics: ScrollPhysics(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 30.0),
                child: Text(
                  "Tests",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: testSeriesData,
                  builder: (context, snapshot) {
                    if (snapshot.hasError)
                      return Center(child: Text(snapshot.error));
                    if (snapshot.hasData) {
                      return (tempData["data"]["data"].length != 0)
                          ? ListView.builder(
                              physics: ScrollPhysics(),
                              itemCount: tempData["data"]["data"].length,
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
                                            return TestScreen(id: tempData["data"]["data"][index]["id"],);
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
                                              tempData["data"]["data"][index]
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
                            )
                          : Center(
                              child: Text('No Test found!'),
                            );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
