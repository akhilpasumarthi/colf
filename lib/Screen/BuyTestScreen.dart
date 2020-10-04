import 'package:bvm/Screen/ExamTestSeriespage.dart';
import 'package:bvm/services/courses.dart';
import 'package:flutter/material.dart';

class BuyTestScreen extends StatefulWidget {
  @override
  _BuyTestScreenState createState() => _BuyTestScreenState();
}

class _BuyTestScreenState extends State<BuyTestScreen> {
  var data, tempData;
  @override
  void initState() {
    super.initState();
    data = getdata();
  }

  getdata() async {
    var x = await getPaidTests();
    setState(() {
      tempData = x;
    });
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.pink[400],
        elevation: 25.0,
        title: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 12.0),
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
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: Text(
                      "My Test Series",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Container(
                  child: FutureBuilder(
                    future: data,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error),
                        );
                      }
                      if (snapshot.hasData) {
                        return (tempData["data"]["data"].length != 0)
                            ? ListView.builder(
                                shrinkWrap: true,
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
                                                  purchased: true,
                                                  old_price: tempData["data"]
                                                          ['data'][index]
                                                      ['old_price'],
                                                  amount: tempData["data"]
                                                      ['data'][index]['price'],
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
