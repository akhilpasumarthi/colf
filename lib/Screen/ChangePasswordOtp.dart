import 'package:bvm/Screen/ChangePasswordReset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sms_autofill/sms_autofill.dart';


class ChangePasswordOtp extends StatefulWidget {
  @override
  _ChangePasswordOtpState createState() => _ChangePasswordOtpState();
}

class _ChangePasswordOtpState extends State<ChangePasswordOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Container(
                  height: 350.0,
                  width: 250.0,
                  child: SvgPicture.asset("assets/images/otp1.svg"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OTP Verification",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enter the OTP send to your Mobile Number",
                      style: TextStyle(
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
               Padding(
                padding: EdgeInsets.only(top: 20.0, left: 100.0, right: 100.0),
                child: PinFieldAutoFill(
                  codeLength: 4,
                
                 
                  
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't you get the OTP?",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[800],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text(
                          "Re-send OTP",
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             
              Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  //color: Colors.blue[900],
                  elevation: 0.0,
                  color: Colors.white,
                  padding: EdgeInsets.only(
                      top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
                  onPressed: () {
                     Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => ChangePasswordResset()));
                  },
                  child: SvgPicture.asset("assets/images/otp10.svg"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
