import 'package:bvm/nda/video.dart';
import 'package:bvm/services/courses.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../Screen/BottomNavigation.dart';

class NdaMathsLecturs extends StatefulWidget {
  final String imageurl;
  final String topicName;
  final id;
  static const routeName = '/NdaMathsLecturs';

  const NdaMathsLecturs({Key key, this.topicName, this.id, this.imageurl}) : super(key: key);

  @override
  _NdaMathsLectursState createState() => _NdaMathsLectursState();
}

class _NdaMathsLectursState extends State<NdaMathsLecturs> {
  int _currentindex = 0;
  var topic_data;
  var topics;
  @override
  void initState() {
    topic_data = gettopicdata();
    super.initState();
  }

  gettopicdata() async {
    var data = await getLecturesMedia(widget.id, 0);
    await Future.delayed(Duration(milliseconds: 2000));
    setState(() {
      topics = data;
    });
    print(topics);
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
                        blurRadius: 5.0,
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
                        imageUrl: widget.imageurl,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Container(
                            height: 30.0,
                            width: 30.0,
                            child: CircularProgressIndicator()),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 25.0),
                child: Container(
                  child: Text(
                    "Lectures of ${widget.topicName}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                //height: MediaQuery.of(context).size.height *1 ,
                padding: EdgeInsets.only(top: 10, left: 10),
                child: FutureBuilder(
                  future: topic_data,
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
                                return mediaListView(index, snapshot.data);
                              },
                            );
                    }
                    return Center(
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        child: CircularProgressIndicator()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget mediaListView(int index, data) {
    return Padding(
      padding:
          EdgeInsets.only(top: 15.0, bottom: 20.0, right: 20.0, left: 10.0),
      child: Container(
        //height: 30.0,
        //width: MediaQuery.of(context).size.width*1,
        child: RaisedButton(
          padding: EdgeInsets.only(
            top: 12.0,
            bottom: 12.0,
          ),
          onPressed: () {
            var url = data["data"]["data"][index]["video_link"];
            print('video url:${data["data"]["data"][index]["video_link"]}');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => video(url: url)));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(color: Colors.grey[800]),
          ),
          elevation: 5.0,
          color: Colors.white,
          child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.red[900],
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        data["data"]["data"][index]["title"],
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
