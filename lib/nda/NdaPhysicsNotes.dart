import 'package:flutter/material.dart';

class NdaPhysicsNotes extends StatefulWidget {
    static const routeName = '/NdaPhysicsNotes';

  @override
  _NdaPhysicsNotesState createState() => _NdaPhysicsNotesState();
}

class _NdaPhysicsNotesState extends State<NdaPhysicsNotes> {
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
                padding: EdgeInsets.only(top: 27.0, left: 25.0),
                child: Text(
                  "Physics(Notes)",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
                child: Text("Oops! Currently there is no Notes Available",
                style: TextStyle(
                  color:Colors.black,
                  fontSize: 20.0,
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
            icon: Icon(Icons.favorite),
            title: Text("Favorite"),
          ),
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