import 'package:flutter/material.dart';
import 'NdaPhysicsNotes.dart';
import 'NdaPhysicsLactures.dart';


class NdaPhysicsScreen extends StatefulWidget {
    static const routeName = '/NdaPhysicssscreen';

  @override
  _NdaPhysicsScreenState createState() => _NdaPhysicsScreenState();
}

class _NdaPhysicsScreenState extends State<NdaPhysicsScreen> {
    int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
     color: Colors.white
   ), 
        backgroundColor: Colors.pink[400],
        elevation: 25.0,
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Padding(
              padding: EdgeInsetsDirectional.only(start: 12.0),
              child: Text(
                "BVM Academy",
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
              padding: EdgeInsets.only(top: 20.0, left: 35.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Physics",
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => NdaPhysicsLactues()));
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
                                    builder: (ctx) => NdaPhysicsNotes()));
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