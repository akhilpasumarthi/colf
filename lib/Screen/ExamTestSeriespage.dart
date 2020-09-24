import 'package:bvm/services/courses.dart';
import 'package:flutter/material.dart';

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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: testSeriesData,
            builder: (context, snapshot) {
              if (snapshot.hasError) return Center(child: Text(snapshot.error));
              if (snapshot.hasData) {
                return (tempData["data"]["data"].length!=0)
                    ? Center(
                        child: Text(tempData["data"]["data"][0]["description"]))
                    : Center(
                        child: Text('No data found!'),
                      );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
