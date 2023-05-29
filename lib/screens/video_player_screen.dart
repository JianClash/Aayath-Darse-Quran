import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:aayath_darse_quran/models/videos_list.dart';

import 'package:aayath_darse_quran/data/database.dart';

import 'package:aayath_darse_quran/screens/home_screen.dart';

class VideoPlayerScreen extends StatefulWidget {
  //
  VideoPlayerScreen({required this.videoItem});
  final VideoItem? videoItem;

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(videoItem: videoItem);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  _VideoPlayerScreenState({this.videoItem});

  VideoItem? videoItem;
  bool? bookmarked;
  YoutubePlayerController? _controller;
  bool? _isPlayerReady;
  BookmarkDataBase? db;

  @override
  void initState() {
    super.initState();
    _isPlayerReady = false;
    db = BookmarkDataBase();
    bookmarked = getBookmarked();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoItem!.video!.resourceId!.videoId!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    )..addListener(_listener);
  }

  getBookmarked(){
    if (db!.getBookmarks().contains(videoItem)){
      return true;
    }
    return false;
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
      body: Container(
				color: const Color.fromRGBO(33, 48, 69, 50),
        child: Column(
          children: [
            YoutubePlayer(
              controller: _controller!,
              showVideoProgressIndicator: true,
              onReady: () {
                _isPlayerReady = true;
              },
            ),

            Align(
              alignment: Alignment.centerLeft,   
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(widget.videoItem!.video!.title!, style: const TextStyle(fontSize: 20))
              )
            ),


            Padding (
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children :  [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[700]),
                      padding: const EdgeInsets.all(5),
                      child: const Row(
                        children:  [
                          Icon(Icons.thumb_up_outlined)
                        ]
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          if (bookmarked == false){
                            db!.addBookmark(videoItem);
                          } else {
                            db!.removeBookmark(videoItem);
                          }
                          db!.updateDataBase();
                          bookmarked = !bookmarked!;
                        });
                      },
                      child: Ink(
                        decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.grey[700], borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Icon(bookmarked! ? Icons.bookmark:Icons.bookmark_outline),
                                Text(bookmarked! ? "Bookmarked":"Bookmark")
                              ]
                            )
                        )
                      )
                    )
                  )
                ],  
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return const HomeScreen();
              })
          );
        },
        child: const Icon(Icons.arrow_back)
      ),
    );
  }
}

