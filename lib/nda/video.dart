

import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class video extends StatefulWidget {
  final  url;
  const video({Key key,this.url }) : super(key:key);
  @override
  _videoState createState() => _videoState();
}

class _videoState extends State<video> {
  YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller= YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    screen();
  }


  void screen()async{
    await FlutterWindowManager.addFlags(
        FlutterWindowManager.FLAG_SECURE);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: false,
          progressIndicatorColor: Colors.blueAccent,

        ),

    );
  }
}
