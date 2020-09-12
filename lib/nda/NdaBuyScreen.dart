import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NdaBuyScreen extends StatefulWidget {
  @override
  _NdaBuyScreenState createState() => _NdaBuyScreenState();
}

class _NdaBuyScreenState extends State<NdaBuyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 25.0,
        title: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
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
                  color: Colors.black,
                  fontSize: 20.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
          Padding(
            padding: EdgeInsets.only(top: 35.0, left: 40.0,right: 20.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Payment Option",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),),
                   Padding(
                    padding: EdgeInsets.only(top: 0.0),
                    child: Divider(
                        color: Colors.white,),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(
                          height: 40.0,
                          width: 70.0,
                          child: SvgPicture.asset("assets/images/paytm.svg"),
                        ),
                        RaisedButton(onPressed: () {},
                        color: Colors.white,
                        child: Row(
                          children: [
                          Text("Pay Now",
                          style: TextStyle(
                            color: Colors.blueAccent[700],
                          ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 5.0),
                          child: Icon(Icons.arrow_forward_ios,size: 10.0,color:Colors.blueAccent[700],),
                          ),
                          ],
                        ),
                        ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Divider(
                        color: Colors.black,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                        height: 70.0,
                        width: 70.0,
                        child: SvgPicture.asset("assets/images/GooglePay.svg"),
                      ),
                       RaisedButton(onPressed: () {},
                      color: Colors.white,
                      child: Row(
                        children: [
                        Text("Pay Now",
                        style: TextStyle(
                          color: Colors.blueAccent[700],
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5.0),
                        child: Icon(Icons.arrow_forward_ios,size: 10.0,color:Colors.blueAccent[700],),
                        ),
                        ],
                      ),
                      ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Divider(
                        color: Colors.black,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Padding(
                      padding: EdgeInsets.only(top: 0.0,left: 00.0,bottom: 0.0),
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        child: SvgPicture.asset("assets/images/razorpay.svg"),
                      ),
                    ),
                     RaisedButton(onPressed: () {},
                      color: Colors.white,
                      child: Row(
                        children: [
                        Text("Pay Now",
                        style: TextStyle(
                          color: Colors.blueAccent[700],
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5.0),
                        child: Icon(Icons.arrow_forward_ios,size: 10.0,color:Colors.blueAccent[700],),
                        ),
                        ],
                      ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0,right: 10.0),
            child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Container(
                      height: 40.0,
                      width: 40.0,
                      child:SvgPicture.asset("assets/images/Mastercard.svg"), 
                  ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      child:SvgPicture.asset("assets/images/RuPay.svg"), 
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      child:SvgPicture.asset("assets/images/verified.svg"), 
                    ),
                  ),
                   Padding(
                     padding: EdgeInsets.only(right: 10.0),
                     child: Container(
                      height: 40.0,
                      width: 40.0,
                      child:SvgPicture.asset("assets/images/visa.svg"), 
                  ),
                   ),
                  ],
                ),
          ),
          ],
        ),
      ),
    );
  }
}
