import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'PasswordResetOtp.dart';

class PasswordForgot extends StatefulWidget {
  @override
  _PasswordForgotState createState() => _PasswordForgotState();
}

class _PasswordForgotState extends State<PasswordForgot> {

TextEditingController mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
           child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 70.0, left: 0.0, right: 0.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120.0,
                            height: 130.0,
                            child: Image.asset(
                              "assets/images/img1.PNG",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.0, bottom: 15.0),
                            child: Text(
                              "BVM DEFENCE ACADMEY",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                    padding: EdgeInsets.only(top: 70.0,left: 30.0,right: 30.0),
                    child: TextFormField(
                      
                      validator: (value) {
                        if (value.isEmpty || value.length < 11) {
                          showToast("Please enter a correct Mobile Number",
                              duration: 3, gravity: Toast.TOP);
                        }
                      },
                       cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hoverColor: Colors.black,
                        contentPadding: EdgeInsets.only(left: 15.0),
                       
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                         hintText: "Mobile Number",
                      ),
                    
                      controller: mobile,
                     
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30.0,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    RaisedButton(onPressed: () {
                       Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => PasswordResetOtp()));
                    },
                    padding: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                    color: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                    child: Text("Verify",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),),
                    ),
                  ],),
                  ),
            ],
        ),
        ),
      ),
    );
  }
   void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
