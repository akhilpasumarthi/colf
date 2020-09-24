import 'package:bvm/Screen/ExamTestSeriespage.dart';
import 'package:bvm/services/courses.dart';
import 'package:flutter/material.dart';

class ExamSeriesPage extends StatefulWidget {
  final id;

  const ExamSeriesPage({Key key, this.id}) : super(key: key);
  @override
  _ExamSeriesPageState createState() => _ExamSeriesPageState();
}

class _ExamSeriesPageState extends State<ExamSeriesPage> {
  var examSeriesData, tempData;
  @override
  void initState() {
    examSeriesData = getdata(widget.id);
    super.initState();
  }

  getdata(var id) async {
    var data = await getExamSeries(id);
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
                  "Exam Series",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder(
                    future: examSeriesData,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error),
                        );
                      }
                      if (snapshot.hasData) {
                        return (tempData["data"]["data"].length!=0)
                            ? ListView.builder(
                                physics: ScrollPhysics(),
                                itemCount: tempData["data"]["data"].length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: 15.0, left: 10.0, right: 10.0),
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(new MaterialPageRoute(
                                            builder: (context) {
                                              return ExamTestSeriesPage(
                                                  id: tempData["data"]["data"]
                                                      [index]["id"]);
                                            },
                                          ));
                                        },
                                        padding: EdgeInsets.only(
                                            top: 15.0,
                                            bottom: 15.0,
                                            left: 10.0),
                                        color: Colors.white,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20.0),
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
                                child: Text('No data found!'),
                              );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
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
