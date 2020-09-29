import 'package:bvm/Screen/pdfViewScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/courses.dart';

class NdaNotesScreen extends StatefulWidget {
  final imageurl;
  final data;
  final String subject_name;
  final  coursedata;
  final id;
  static const routeName = '/NdaMathsNotesscreen';

  const NdaNotesScreen({Key key, this.id, this.imageurl,this.subject_name,this.coursedata,this.data}) : super(key: key);

  @override
  _NdaNotesScreenState createState() => _NdaNotesScreenState();
}

class _NdaNotesScreenState extends State<NdaNotesScreen> {
  int _currentindex = 1 ;
  var data, tempdata;
  var subjects;
var topics;
  var count;


  @override
  void initState() {
    super.initState();
    data = getdata();
  }

  getdata() async {
    var _data = await getLecturesMedia(widget.id, 0);
    setState(() {
      tempdata = _data;
        count = data["data"]['data'].length;
      topics = data;
    });
    print(tempdata["data"]["data"]);
    return tempdata;
  }
  
  


  getsubDetails() async {
    print(widget.coursedata["id"]);

    var data = await getCourseSubjects(widget.coursedata["id"]);
    await Future.delayed(Duration(milliseconds: 1500));
    
    setState(() {
      subjects = data;
    });
    return data;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.pink[400],
        elevation: 25.0,
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Padding(
              padding: EdgeInsetsDirectional.only(start: 12.0),
              child: Text(
                "BVM Defence Academy",
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
      body: SingleChildScrollView(
        child: Container(
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
                        child:CachedNetworkImage(
                        imageUrl: widget.imageurl,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Container(
                            height: 30.0,
                            width: 30.0,
                            child: Center(child: CircularProgressIndicator())),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 27.0, left: 25.0),
                child: Text(
                  "(Notes)",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: FutureBuilder(
                  future: data,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return (tempdata["data"]["data"].length != 0)
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: tempdata["data"]["data"].length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  child: RaisedButton(
                                    elevation: 5,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(tempdata["data"]["data"]
                                          [index]['title']),
                                    ),
                                    onPressed: () async {
                                      Navigator.of(context)
                                          .push(new MaterialPageRoute(
                                        builder: (context) {
                                          return PdfView(
                                            url: tempdata["data"]["data"][index]
                                                ['file_path'],
                                          );
                                        },
                                      ));
                                    },
                                  ),
                                );
                              },
                            )
                          : emptyNotesWidget();
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

  Widget emptyNotesWidget() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0, left: 0.0),
          child: Container(
            //height: 95,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 140),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          child: Image.asset(
                            "assets/images/oops.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30.0, left: 20.0),
          child: Text(
            "Oops! Currently there is no Notes Available",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
