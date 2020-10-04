import 'package:bvm/Screen/TestScreen.dart';
import 'package:bvm/nda/NdaBuyScreen.dart';
import 'package:bvm/services/courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ExamTestSeriesPage extends StatefulWidget {
  final id;
  final amount;
  final old_price;
  final bool purchased;

  const ExamTestSeriesPage(
      {Key key, this.id, this.amount, this.old_price, this.purchased})
      : super(key: key);
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
                child: FutureBuilder(
                  future: testSeriesData,
                  builder: (context, snapshot) {
                    if (snapshot.hasError)
                      return Center(child: Text(snapshot.error));
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
                                        if (widget.purchased) {
                                          Navigator.of(context)
                                              .push(new MaterialPageRoute(
                                            builder: (context) {
                                              return TestScreen(
                                                id: tempData["data"]["data"]
                                                    [index]["id"],
                                              );
                                            },
                                          ));
                                        }
                                      },
                                      padding: EdgeInsets.only(
                                          top: 15.0, bottom: 15.0, left: 10.0),
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
                              child: Text('No Test found!'),
                            );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              (!widget.purchased)
                  ? Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 22.0),
                            child: RaisedButton(
                              color: Colors.blueAccent[700],
                              onPressed: () {
                                print(widget.id);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => NdaBuyScreen(
                                              amount: num.parse(widget.amount),
                                              id: widget.id,
                                              type: "test",
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
                                    top: 10.0, left: 13.0, bottom: 60.0),
                                child: Row(
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: <TextSpan>[
                                          new TextSpan(
                                            text: '\₹${widget.old_price}',
                                            style: new TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        '\₹${widget.amount}',
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
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
