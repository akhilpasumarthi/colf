import 'package:flutter/material.dart';
import 'package:bvm/services/courses.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../nda/NdaScreen.dart';


class OurBatches extends StatefulWidget {
  @override
  _OurBatchesState createState() => _OurBatchesState();
}

class _OurBatchesState extends State<OurBatches> {

int _currentindex = 0;
  List courseNameList = [];
  List courseimageurl=[];

  var courseData;
  Map courses;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    courseData = courselist();
  }

  courselist() async {
    Map course1 = await getcourses();
    setState(() {
      courses = course1;
      print(courses['success']);
      courses["data"]["data"].forEach((element) {
        courseNameList.add(element["title"]);
        courseimageurl.add(element['course_image']);

      });
    });
    return courses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 25.0,
        title: Row(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: 17),
              child: Text(
                "Our Batches",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                              child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.height * 1.0,
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder(
                      future: courseData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            itemCount: courseNameList.length,
                            physics: ScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return Padding(
                  padding: EdgeInsets.only(top: 17.0),
                  child:  Container(
                    //height: 100.0 ,
                    //width: 130,
                    child: RaisedButton(
                padding: EdgeInsets.only(top: 0.0,left: 0.0,right: 0.0),
                color: Colors.white,
                onPressed: () {
                 
                },
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0.0),
                      child: Container(

                        width: 170,
                        height: 95,
                        child: CachedNetworkImage(imageUrl: courseimageurl[index],
                        fit: BoxFit.fill,
                       // height: 100.0,
                          placeholder: (context, url) => Container(
                            height: 30.0,
                            width: 30.0,
                            child: CircularProgressIndicator()),),

                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top: 12.0,bottom: 5.0),
                      child: Text(
                        courseNameList[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
                    ),
                  ),
                              );
                            },
                          );
                        }
                        return Center(
                          child: Container(
                            width: 30.0,
                            height: 40.0,
                            child: CircularProgressIndicator()),
                        );
                      },
                    ),
                  ),
              ),
            ),
           
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}
