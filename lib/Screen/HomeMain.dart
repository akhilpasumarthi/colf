import 'package:bvm/Screen/DemoClasses.dart';
import 'package:bvm/Screen/ExamTestSeriespage.dart';
import 'package:bvm/Screen/TestSerisscreen.dart';
import 'package:bvm/nda/NdaBuyScreen.dart';
import 'package:flutter/material.dart';
import 'package:bvm/Screen/MoreCourseScreen.dart';
import 'package:bvm/Screen/FeaturesScreen.dart';
import 'package:bvm/nda/NdaScreen.dart';
import 'BottomNavigation.dart';
import 'package:bvm/services/courses.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeMain extends StatefulWidget {
  static const routeName = '/HomeMain';

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int _currentindex = 0;
  List courseNameList = [];
  List courseimageurl = [];
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
        backgroundColor: Colors.white,
        elevation: 25.0,
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
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
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Container(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 160,
                              child: Image.asset(
                                "assets/images/img2.jpeg",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 160,
                              child: Image.asset(
                                "assets/images/img3.jpg",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 160,
                              child: Image.asset(
                                "assets/images/img4.jpg",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 7.0, left: 25.0),
                              child: Text(
                                "Courses",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),

                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Container(
                                  //width: 170,
                                  //height: 200,
                                  //decoration: BoxDecoration(color: Colors.white70),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                       Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: courseData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      itemCount: courseNameList.length,
                      physics: ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.9,
                          crossAxisSpacing: 20,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 17.0),
                          child: Container(
                            //height: 100.0 ,
                            width: 130,
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
                                      height: 100,
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
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 15.0, right: 20.0),
                                        child: Container(
                                          // height: 15.0,
                                          //width: 20.0,
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            elevation: 0.0,
                                            color: Colors.indigo[500],
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          MoreCourseScreen()));
                                            },
                                            child: Text(
                                              "See all",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 130,
                              child: Image.asset(
                                "assets/images/img2.jpeg",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 130,
                              child: Image.asset(
                                "assets/images/img3.jpg",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 130,
                              child: Image.asset(
                                "assets/images/img4.jpg",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 17.0),
                    child: Container(
                      width: 150,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => DemoClasses()));
                        },
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Container(
                                //width: 170,
                                height: 80,
                                child: SvgPicture.asset(
                                    "assets/images/democlasses.svg"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Demo Classes",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 17.0),
                    child: Container(
                      width: 150,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {},
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Container(
                                //width: 170,
                                height: 80,
                                child: SvgPicture.asset(
                                    "assets/images/assignment.svg"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Assignment",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 17.0),
                    child: Container(
                      width: 150,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {},
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Container(
                                //width: 170,
                                height: 80,
                                child:
                                    SvgPicture.asset("assets/images/live.svg"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Live Session",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 17.0),
                    child: Container(
                      width: 150,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => TestSeriesScreen()));
                        },
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Container(
                                //width: 170,
                                height: 80,
                                child: SvgPicture.asset(
                                    "assets/images/testseries.svg"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Test Series",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 30.0, top: 15.0, right: 25.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => FeaturesScreen()));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 18.0,
                      color: Colors.indigo[800],
                      child: Row(
                        children: [
                          Text(
                            "More",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, right: 0.0),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}
