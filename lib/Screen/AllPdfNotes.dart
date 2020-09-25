import 'package:bvm/Screen/pdfViewer.dart';
import 'package:flutter/material.dart';
import 'package:bvm/services/courses.dart';
import '../nda/NdaScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';


class AllPdfNotes extends StatefulWidget {
  @override
  _AllPdfNotesState createState() => _AllPdfNotesState();
}

class _AllPdfNotesState extends State<AllPdfNotes> {


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
          // crossAxisAlignment: CrossAxisAlignment.star,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: 17),
              child: Text(
                "Pdf Courses",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
             Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height * 0.88,
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
                          crossAxisSpacing: 15,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 17.0),
                          child: Container(
                            height: 130.0 ,
                            width: 130,
                            child: RaisedButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
                                  return NdaScreen(coursedata: courses["data"]["data"][index]);
                                },));
                              },
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Container(

                                      //width: 170,
                                      height: 100,
                                      child: CachedNetworkImage(imageUrl: courseimageurl[index],
                                        placeholder: (context, url) => CircularProgressIndicator(),),

                                    ),
                                  ),
                                  Padding(
                                    padding:EdgeInsets.only(top: 10.0,bottom: 5.0),
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
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
           
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}
