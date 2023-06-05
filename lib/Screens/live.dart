import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class live extends StatefulWidget {
  @override
  liveState createState() => liveState();
}

class liveState extends State<live> {
  String _videoUrl = '';
  YoutubePlayerController _controller;

  void _playVideo() {
    setState(() {
      _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(_videoUrl) ?? '',
        flags: YoutubePlayerFlags(
          autoPlay: true,
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      _videoUrl = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter YouTube video URL',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: _playVideo,
                  child: Text('Play'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: _controller != null
                  ? YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              )
                  : Text('Enter a YouTube video URL and click Play.'),
            ),
          ),
        ],
      ),
    );
  }
}
