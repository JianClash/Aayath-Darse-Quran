import 'package:flutter/material.dart';
import 'package:aayath_darse_quran/models/videos_list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  //
  VideoPlayerScreen({required this.videoItem});
  final VideoItem videoItem;

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  //
  YoutubePlayerController? _controller;
  bool? _isPlayerReady;

  @override
  void initState() {
    super.initState();
    _isPlayerReady = false;
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoItem.video!.resourceId!.videoId!,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (_isPlayerReady! && mounted && !_controller!.value.isFullScreen) {
      //
    }
  }

  @override
  void deactivate() {
    _controller!.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoItem.video!.title!),
      ),
      body: Container(
				color: const Color.fromRGBO(33, 48, 69, 50),
        child: YoutubePlayer(
          controller: _controller!,
          showVideoProgressIndicator: true,
          onReady: () {
            _isPlayerReady = true;
          },
        ),
      ),
    );
  }
}
