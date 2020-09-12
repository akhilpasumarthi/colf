import 'package:flutter/material.dart';

class NdaPhysicsLactues extends StatefulWidget {
    static const routeName = '/NdaPhysicsLectues';

  @override
  _NdaPhysicsLactuesState createState() => _NdaPhysicsLactuesState();
}

class _NdaPhysicsLactuesState extends State<NdaPhysicsLactues> {
    int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
     color: Colors.black
   ), 
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
                padding: EdgeInsets.only(top: 20.0, left: 20.0),
                child: Container(
                  //height: 95,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Physics(Lecturs)",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            Container(
                              height: 85,
                              width: 100,
                              child: RaisedButton(
                                onPressed: () {},
                                elevation: 30.0,
                                color: Colors.white,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 40,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: RaisedButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Colors.grey[800]),
                                ),
                                elevation: 5.0,
                                color: Colors.white,
                                child: Text(
                                  "Lecture 1",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Container(
                              height: 85,
                              width: 100,
                              child: RaisedButton(
                                onPressed: () {},
                                elevation: 30.0,
                                color: Colors.white,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 40,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: RaisedButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Colors.grey[800]),
                                ),
                                elevation: 5.0,
                                color: Colors.white,
                                child: Text(
                                  "Lecture 2",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: [
                            Container(
                              height: 85,
                              width: 100,
                              child: RaisedButton(
                                onPressed: () {},
                                elevation: 30.0,
                                color: Colors.white,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 40,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: RaisedButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Colors.grey[800]),
                                ),
                                elevation: 5.0,
                                color: Colors.white,
                                child: Text(
                                  "Lecture 3",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: [
                            Container(
                              height: 85,
                              width: 100,
                              child: RaisedButton(
                                onPressed: () {},
                                elevation: 30.0,
                                color: Colors.white,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 40,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: RaisedButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Colors.grey[800]),
                                ),
                                elevation: 5.0,
                                color: Colors.white,
                                child: Text(
                                  "Lecture 4",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: [
                            Container(
                              height: 85,
                              width: 100,
                              child: RaisedButton(
                                onPressed: () {},
                                elevation: 30.0,
                                color: Colors.white,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 40,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: RaisedButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Colors.grey[800]),
                                ),
                                elevation: 5.0,
                                color: Colors.white,
                                child: Text(
                                  "Lecture 5",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: [
                            Container(
                              height: 85,
                              width: 100,
                              child: RaisedButton(
                                onPressed: () {},
                                elevation: 30.0,
                                color: Colors.white,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.red,
                                  size: 40,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: RaisedButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Colors.grey[800]),
                                ),
                                elevation: 5.0,
                                color: Colors.white,
                                child: Text(
                                  "Lecture 6",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.indigo[800],
              icon: Icon(Icons.home),
              title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("Favorite"),),
          BottomNavigationBarItem(
              icon: Icon(Icons.book), title: Text("E-Book")),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), title: Text("User")),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}