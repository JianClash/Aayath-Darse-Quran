import 'package:aayath_darse_quran/models/play_lists_info.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:aayath_darse_quran/models/channel_info.dart';
import 'package:aayath_darse_quran/models/videos_list.dart';
import 'package:aayath_darse_quran/screens/video_player_screen.dart';
import 'package:aayath_darse_quran/utils/services.dart';

class Ayaahs extends StatefulWidget {
	
	Ayaahs({String? this.playListId});
	final String? playListId;

  @override
  _AyaahsState createState() => _AyaahsState(playListId: playListId);
}

class _AyaahsState extends State<Ayaahs> {
	_AyaahsState({String? this.playListId});
	
	String? playListId;
  ChannelInfo? _channelInfo;
  VideosList? _videosList;
  Item? _item;
  bool? _loading;
  String? _nextPageToken;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _nextPageToken = '';
    _scrollController = ScrollController();
    _videosList = VideosList();
    _videosList?.videos = [];
    // playListId = playListId;
    _getChannelInfo();
		print(playListId);
  }

  _getChannelInfo() async {
    _channelInfo = await Services.getChannelInfo();
    _item = _channelInfo!.items![0];
    print('_playListId $playListId');
    await _loadVideos();
    setState(() {
      _loading = false;
    });
  }

  _loadVideos() async {
    VideosList tempVideosList = await Services.getVideosList(
      playListId: playListId,
      pageToken: _nextPageToken,
    );
    _nextPageToken = tempVideosList.nextPageToken;
    _videosList!.videos!.addAll(tempVideosList.videos!);
    print('videos: ${_videosList!.videos!.length}');
    print('_nextPageToken $_nextPageToken');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading! ? 'Loading...' : 'Aayath Darse Quran'),
      ),
      body: Container(
        child: Column(
          children: [
						_loading! ? CircularProgressIndicator() :
            Expanded(
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (ScrollNotification notification) {
                  if (_videosList!.videos!.length >=
                      int.parse(_item!.statistics!.videoCount!)) {
                    return true;
                  }
                  if (notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent) {
                    _loadVideos();
                  }
                  return true;
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _videosList!.videos!.length,
                  itemBuilder: (context, index) {
                    VideoItem videoItem = _videosList!.videos![index];
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
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: videoItem.video!.thumbnails!.thumbnailsDefault!.url!,
                            ),
                            SizedBox(width: 20),
                            Flexible(child: Text(videoItem.video!.title!)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
