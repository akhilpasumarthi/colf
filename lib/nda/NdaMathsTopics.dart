import 'package:bvm/services/courses.dart';
import 'package:flutter/material.dart';
import 'NdaMathsLecturs.dart';

class NdaMathsTopics extends StatefulWidget {
  final String subject_name;
  final id;

  const NdaMathsTopics({Key key, this.subject_name, this.id}) : super(key: key);
  @override
  _NdaMathsTopicsState createState() => _NdaMathsTopicsState();
}

class _NdaMathsTopicsState extends State<NdaMathsTopics> {
  var lectures_data;
  var topics;
  var count;
  @override
  void initState() {
    lectures_data = getdata();
    lectures_data = getSubjectDetails(widget.id);
    super.initState();
  }

  getdata() async {
    var data = await getSubjectDetails(widget.id);
    setState(() {
      count = data["data"]['data'].length;
      topics = data;
    });
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
                "BVN Defence Academy",
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
      body: Container(
        decoration: BoxDecoration(),
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
                      blurRadius: 3.0,
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
              padding: EdgeInsets.only(top: 20.0, left: 25.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Topics of ${widget.subject_name}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*1,
                      height: MediaQuery.of(context).size.height * 0.45,
                      padding: EdgeInsets.only(top: 10),
                      child: FutureBuilder(
                        future: lectures_data,
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
                                      return topicListView(
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
                   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topicListView(int index, data) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, right: 50),
      child: Container(
       width:MediaQuery.of(context).size.width*1,
        child: Row(
          children: [
            RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => NdaMathsLecturs(
                            id: data["data"]["data"][index]["id"],
                            topicName: data["data"]["data"][index]['title'],
                          )));
            },
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 7.0),
            color: Colors.white,
            elevation: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
          width:MediaQuery.of(context).size.width*0.70,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                      padding: EdgeInsets.only(left: 14.0),
                      child: Text(
                        data["data"]["data"][index]['title'],
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                      ),
                    ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
