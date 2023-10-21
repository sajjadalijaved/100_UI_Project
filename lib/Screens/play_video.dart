import 'package:flutter/material.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';
// ignore_for_file: library_private_types_in_public_api

// ignore_for_file: unused_field, avoid_unnecessary_containers, unused_element

class PlayVideoExample extends StatefulWidget {
  const PlayVideoExample({Key? key}) : super(key: key);

  @override
  _PlayVideoExampleState createState() => _PlayVideoExampleState();
}

class _PlayVideoExampleState extends State<PlayVideoExample>
    implements YouTubePlayerListener {
  double _currentVideoSecond = 0.0;
  String _playerState = "";
  late FlutterYoutubeViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
          child: FlutterYoutubeView(
        onViewCreated: _onYoutubeCreated,
        listener: this,
        params: const YoutubeParam(
          videoId: 'dhKRflZUicU',
          showUI: true,
          startSeconds: 0,
          showYoutube: false,
          showFullScreen: true,
        ),
      )),
    ]));
  }

  @override
  void onCurrentSecond(double second) {
    _currentVideoSecond = second;
  }

  @override
  void onError(String error) {}

  @override
  void onReady() {}

  @override
  void onStateChange(String state) {
    setState(() {
      _playerState = state;
    });
  }

  @override
  void onVideoDuration(double duration) {}

  void _onYoutubeCreated(FlutterYoutubeViewController controller) {
    _controller = controller;
  }

  void _loadOrCueVideo() {
    _controller.loadOrCueVideo('gcj2RUWQZ60', _currentVideoSecond);
  }
}
