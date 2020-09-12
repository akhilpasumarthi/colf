import 'package:bvm/Screen/BottomNavigation.dart';
import 'package:flutter/material.dart';
import '../Nda/NdaMathsScreen.dart';
import 'NdaPhysicsScreen.dart';
import 'NdaBuyScreen.dart';

class NdaScreen extends StatefulWidget {
  static const routeName = '/NdaScreen';

  @override
  _NdaScreenState createState() => _NdaScreenState();
}

class _NdaScreenState extends State<NdaScreen> {

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
     color: Colors.black
   ), 
        //shadowColor: Colors.red,
        backgroundColor: Colors.white,
        elevation: 25.0,
        title: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
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
          decoration: BoxDecoration(),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white,
                      //shape: .circle,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ),
                      ]),
                  height: 170,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Image.asset(
                          "assets/images/nda.jpeg",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "NDA",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(
                                "Subject",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => NdaMathsScreen()));
                                },
                                color: Colors.white,
                                child: Container(
                                  height: 100.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 7.5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          width: 130.0,
                                          height: 85.0,
                                          child: Image.asset(
                                            "assets/images/nda.jpeg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, top: 10.0),
                                        child: Container(
                                          //height: 70,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Maths",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                child: Text(
                                                  "Total Lactures 30",
                                                  style: TextStyle(
                                                    color: Colors.grey,
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
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: RaisedButton(
                                color: Colors.white,
                                onPressed: () {
                                   
                                },
                                
                                child: Container(
                                  height: 100.0,
                                  child: Padding(
                                    padding: EdgeInsets.only(top:7.5,bottom: 7.5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                        
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          width: 130.0,
                                          height: 85.0,
                                          child: Image.asset(
                                            "assets/images/nda.jpeg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25.0),
                                          child: Container(
                                            //height: 70,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "General Ability",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    "Part(A)-English",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey[800],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    "Part(B)-GK",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey[800],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    "Total Lactures 30",
                                                    style: TextStyle(
                                                      color: Colors.grey[900],
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
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: RaisedButton(
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => NdaPhysicsScreen()));
                                },
                                child: Container(
                                  height: 100.0,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 7.5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          width: 130.0,
                                          height: 85.0,
                                          child: Image.asset(
                                            "assets/images/nda.jpeg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25.0),
                                          child: Container(
                                            //height: 70,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Physics",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Text("Total Lactures 30"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: RaisedButton(
                                color: Colors.white,
                                onPressed: () {},
                                child: Container(
                                  height: 100.0,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 7.5,bottom: 7.5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          width: 130.0,
                                          height: 85.0,
                                          child: Image.asset(
                                            "assets/images/nda.jpeg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25.0),
                                          child: Container(
                                            //height: 70,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Chemistry",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Text("Total Lactures 30"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: RaisedButton(
                                onPressed: () {},
                                color: Colors.white,
                                child: Container(
                                  height: 100.0,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 7.5,bottom: 7.5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          width: 130.0,
                                          height: 85.0,
                                          child: Image.asset(
                                            "assets/images/nda.jpeg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25.0),
                                          child: Container(
                                            //height: 70,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "GS",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Text("Total Lactures 30"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: RaisedButton(
                                onPressed: () {},
                                color: Colors.white,
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 7.5,bottom: 7.5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          width: 130.0,
                                          height: 85.0,
                                          child: Image.asset(
                                            "assets/images/nda.jpeg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25.0),
                                          child: Container(
                                            //height: 70,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "History",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Text("Total Lactures 30"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: RaisedButton(
                                onPressed: () {},
                                color: Colors.white,
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 7.5,bottom: 7.5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          width: 130.0,
                                          height: 85.0,
                                          child: Image.asset(
                                            "assets/images/nda.jpeg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25.0),
                                          child: Container(
                                            //height: 70,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Geography",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Text("Total Lactures 30"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: RaisedButton(
                                onPressed: () {},
                                color: Colors.white,
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(top:7.5,bottom: 7.5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          width: 130.0,
                                          height: 85.0,
                                          child: Image.asset(
                                            "assets/images/nda.jpeg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25.0),
                                          child: Container(
                                            //height: 70,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Current Affairs",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Text("Total Lactures 30"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.0, top: 22.0),
                                    child: RaisedButton(
                                      color: Colors.orange[800],
                                      onPressed: () {
                                         Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (ctx) =>
                                                             NdaBuyScreen()));
                                      },
                                      child: Text(
                                        "Buy Now",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 135.0, bottom: 60.0),
                                    child: Row(
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: <TextSpan>[
                                              new TextSpan(
                                                text: '\₹5000',
                                                style: new TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.black,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            "₹2499",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavigation(),
    );
  }
}
