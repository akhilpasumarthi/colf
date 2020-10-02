import 'package:bvm/services/courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class NdaBuyScreen extends StatefulWidget {
  final amount;

  final id;
  final String type;

  const NdaBuyScreen({Key key, this.amount, this.id, this.type})
      : super(key: key);



 // const NdaBuyScreen({Key key, this.amount,this.courseid}) : super(key: key);

  @override
  _NdaBuyScreenState createState() => _NdaBuyScreenState();
}

class _NdaBuyScreenState extends State<NdaBuyScreen> {
  Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    print(widget.amount);

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckOut() async {
    await orderRequest("2",widget.amount,"id","1","test");
    var options = {
      'key': 'rzp_test_l0Dmpg9h9w6ZhD', //enter your key form razorpay account.
      'amount': widget.amount.toInt() * 100,
      'name': 'Course Payment',
      'description': 'To Buy the Course',
      'prefill': {'contact': '', 'email': ''}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Toast.show('Success, PaymentID:${response.paymentId}', context);
    var data = await orderRequest(widget.id, widget.amount, "abc", "1", "test"); //add function of orderrequest..
    print(data);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Toast.show("error, error code is ${response.message}", context,
        duration: 5);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Toast.show("external wallet ${response.walletName}", context);
  }

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
              padding: EdgeInsets.only(top: 35.0, left: 40.0, right: 20.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Select Payment Option",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0.0),
                      child: Divider(
                        color: Colors.white,
                      ),
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
                              child:
                                  SvgPicture.asset("assets/images/paytm.svg"),
                            ),
                            RaisedButton(
                              onPressed: () {},
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Text(
                                    "Pay Now",
                                    style: TextStyle(
                                      color: Colors.blueAccent[700],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 10.0,
                                      color: Colors.blueAccent[700],
                                    ),
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
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 70.0,
                            width: 70.0,
                            child:
                                SvgPicture.asset("assets/images/GooglePay.svg"),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.white,
                            child: Row(
                              children: [
                                Text(
                                  "Pay Now",
                                  style: TextStyle(
                                    color: Colors.blueAccent[700],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10.0,
                                    color: Colors.blueAccent[700],
                                  ),
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
                        color: Colors.black,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 0.0, left: 00.0, bottom: 0.0),
                          child: Container(
                            height: 100.0,
                            width: 100.0,
                            child:
                                SvgPicture.asset("assets/images/razorpay.svg"),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            openCheckOut();
                          },
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text(
                                "Pay Now",
                                style: TextStyle(
                                  color: Colors.blueAccent[700],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 10.0,
                                  color: Colors.blueAccent[700],
                                ),
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
              padding: EdgeInsets.only(top: 30.0, right: 10.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      child: SvgPicture.asset("assets/images/Mastercard.svg"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      child: SvgPicture.asset("assets/images/RuPay.svg"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      child: SvgPicture.asset("assets/images/verified.svg"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      child: SvgPicture.asset("assets/images/visa.svg"),
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
