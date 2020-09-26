import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class web_viewpage extends StatefulWidget {
  var url;
  web_viewpage({this.url});
  @override
  _web_viewpageState createState() => _web_viewpageState();
}

class _web_viewpageState extends State<web_viewpage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
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
      // body: WebView(
      //   javascriptMode: JavascriptMode.unrestricted,
      //   initialUrl: widget.url,
      //   onWebViewCreated: (WebViewController _webviewcontroller) {
      //     _controller.complete(_webviewcontroller);
      //   },
      // ),
      body: Container(
          child: PDF.network(
        widget.url,
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.height,
      )),
    );
  }
}
