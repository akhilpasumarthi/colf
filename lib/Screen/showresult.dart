import 'package:bvm/services/courses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestScreen1 extends StatefulWidget {
  final id;
  final result;
  final selected;


  const TestScreen1({Key key, this.id, this.result, this.selected,}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}
var keylist=[];
var answerlist=[];
var selected=[];
class _TestScreenState extends State<TestScreen1> {
  var qsndata, tempData, qsncount;
  final bool loop = false;
  List<bool> checklist = [];
  var colorlist = [];
  List selectedanswers = [];

  Map<String, String> answerId = {};

  @override
  void initState() {
    qsndata = getdata(widget.id);
    super.initState();
  }

  getdata(var id) async {
    var data = await getTestQsns(id);
    setState(() {
      tempData = (data);
      qsncount = tempData['data'].length;
      selected = widget.selected;
    });


    for (var i = 0; i < qsncount; i++) {
      for (var j = 0; j < 4; j++) {
        if (tempData["data"][i]["options"][j]["correct"] == "1") {
          print(j);
          keylist.add(j+1);
          answerlist.add(tempData["data"][i]["options"][j]["option_text"]);
        }
      }
    }
    print(answerId);
    print(widget.result);
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
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
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
                // child: RaisedButton(
                //   onPressed: () async {
                //     var x = await getmarks(widget.id, answerId);
                //     print(x);
                //     print(selectedanswers);
                //     //print(answerId);
                //   },
                //   child: Text('Submit'),
                // ),
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

                  },

                  child: Text(
                      tempdata['data'][index]['options'][0]['option_text']),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: RaisedButton(
                  onPressed: () {

                  },

                  child: Text(
                      tempdata['data'][index]['options'][1]['option_text']),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: RaisedButton(
                  onPressed: () {

                  },

                  child: Text(
                      tempdata['data'][index]['options'][2]['option_text']),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: RaisedButton(
                  onPressed: () {

                  },

                  child: Text(
                      tempdata['data'][index]['options'][3]['option_text']),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(4.0),


                child: Text("selected option: ${selected[index]}",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),


                child: Text("correct option: ${keylist[index]}",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),


                child: Text("reason: ${answerlist[index]}",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}