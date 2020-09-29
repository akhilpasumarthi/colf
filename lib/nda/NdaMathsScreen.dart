import 'package:bvm/Nda/NdaMathsLecturs.dart';
import 'package:bvm/nda/NdaMathsNotesScreen.dart';
import 'package:bvm/nda/NdaMathsTopics.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NdaMathsScreen extends StatefulWidget {
  final data;
  final String subject_name;
  final id;
  static const routeName = '/NdaMathsscreen';

  const NdaMathsScreen({Key key, this.subject_name, this.id, this.data})
      : super(key: key);

  @override
  _NdaMathsScreenState createState() => _NdaMathsScreenState();
}

class _NdaMathsScreenState extends State<NdaMathsScreen> {
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
                      child: CachedNetworkImage(
                        imageUrl: widget.data['lesson_image'],
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
              padding: EdgeInsets.only(top: 20.0, left: 35.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.subject_name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: 190.0,
                        child: RaisedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (ctx) => NdaMathsTopics(id:widget.id,subject_name:widget.subject_name)));
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) {
                              return NdaMathsLecturs(
                                imageurl: widget.data['lesson_image'],
                                id: widget.id,
                                topicName: widget.subject_name,
                              );
                            }));
                          },
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 7.0),
                          color: Colors.white,
                          elevation: 30.0,
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.red[800],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14.0),
                                child: Text(
                                  "Lectures",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: 190.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => NdaNotesScreen(
                                          id: widget.id,
                                          imageurl:widget.data['lesson_image'],
                                        )));
                          },
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 7.0),
                          color: Colors.white,
                          elevation: 30.0,
                          child: Row(
                            children: [
                              Icon(
                                Icons.filter_none,
                                color: Colors.red,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14.0),
                                child: Text(
                                  "Notes",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 33.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
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
}
