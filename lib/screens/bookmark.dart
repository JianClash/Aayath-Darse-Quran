import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:aayath_darse_quran/screens/video_player_screen.dart';

import 'package:aayath_darse_quran/data/database.dart';

import 'package:aayath_darse_quran/models/videos_list.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  List? _shownBookmarks;
  bool? _loading;
  ScrollController? _scrollController;
  BookmarkDataBase? db;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _loading = true;
    db = BookmarkDataBase();
    _shownBookmarks = [];
     _loadBookmarks();
  }

  _loadBookmarks() async {
    _shownBookmarks!.addAll(db!.getBookmarks());
    setState(() {
      _loading = false;       
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _loading! ?  const CircularProgressIndicator() :
        Expanded(
          // child: NotificationListener<ScrollEndNotification>(
          //   onNotification: (ScrollNotification notification) {
          //     if (BookmarkDataBase().bookmarks.length >= _shownBookmarks!.length){
          //       return true;
          //     }
          //     return true;
          //   },
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _shownBookmarks!.length,
              itemBuilder: (context, index) {
                VideoItem videoItem = _shownBookmarks![index];
                return InkWell(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return VideoPlayerScreen(
                        videoItem: videoItem,
                      );
                    }));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: videoItem.video!.thumbnails!.thumbnailsDefault!.url!,
                        ),
                        const SizedBox(width: 20),
                        Flexible(child: Text(videoItem.video!.title!)),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        // )
      ],
    );
  }
}
