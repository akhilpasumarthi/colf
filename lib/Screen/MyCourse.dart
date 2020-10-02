import 'package:bvm/Screen/MoreCourseScreen.dart';
import 'package:bvm/nda/NdaScreen.dart';
import 'package:bvm/services/courses.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'BottomNavigation.dart';

class MyCourse extends StatefulWidget {

  @override
  _MyCourseState createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  int _currentindex = 0;
  List courseNameList = [];
  List courseimageurl=[];
  var courseData;
  Map courses;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    courseData=courselist();
  }
  courselist() async {
    //Map course1 = await getcourses();
    Map course2=await getPurchasedCourses();
    print(course2);
    setState(() {
      courses = course2;
      //print(courses['success']);
      print(courses["data"]["data"]);
      courses["data"]["data"].forEach((element) {
        courseNameList.add(element["title"]);
        courseimageurl.add(element['course_image']);
      });
    });
    print(courseNameList);
    print(courseimageurl);
    print(courses);
    return courses;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.pink,
        elevation: 25.0,
        title: Row(
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: 17,bottom: 5.0),
              child: Text(
                "My Courses",
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
                                    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
                                      return NdaScreen(coursedata: courses["data"]["data"][index]);
                                    },));
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
                      else {
                        getaddcourse(context);
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

Widget getaddcourse(context){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text(
                "My Courses",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Container(
            height: 250.0,
            width: 250.0,
            child: SvgPicture.asset("assets/images/error.svg"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => MoreCourseScreen()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 30.0,
                color: Colors.orange,
                padding: EdgeInsets.only(
                    top: 8.0, left: 10.0, bottom: 8.0, right: 10.0),
                child: Text(
                  "ADD COURSE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),

  );
}