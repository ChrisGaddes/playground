import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BoringPage(),
    );
  }
}

class BoringPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: PlaybackButton()),
    );
  }
}


class PlaybackButton extends StatefulWidget {
  @override
  _PlaybackButtonState createState() => _PlaybackButtonState();
}

class _PlaybackButtonState extends State<PlaybackButton> {
  bool _isPlaying = false;
  FlutterSound _sound;
  final url =
      'https://incompetech.com/music/royalty-free/mp3-royaltyfree/Surf%20Shimmy.mp3';

  @override
  void initState() {
    super.initState();
    _sound = FlutterSound();
  }

  void _stop() async {
    await _sound.stopPlayer();
  }

  void _play() async {
    await _sound.startPlayer(url);
  }

  void _pause() async {
    await _sound.pausePlayer();
  }

  void _resume() async {
    await _sound.resumePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _isPlaying ? Icon(Icons.stop) : Icon(Icons.play_arrow),
      onPressed: () {
        _isPlaying ? _pause() : _play();

        setState(() {
          _isPlaying = !_isPlaying;
        });
      },
    );
  }
}

//http://clovermedia.s3-us-west-2.amazonaws.com/store/5597af0f-80f6-464d-b0a3-1460d5675a9a/66a724ea1a/audio.mp3
