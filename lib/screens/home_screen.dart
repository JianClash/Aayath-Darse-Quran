import 'package:aayath_darse_quran/models/play_lists_info.dart';
import 'package:aayath_darse_quran/screens/ayaahs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:aayath_darse_quran/models/channel_info.dart';
import 'package:aayath_darse_quran/models/videos_list.dart';
import 'package:aayath_darse_quran/utils/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  ChannelInfo? _channelInfo;
	PlayListsInfo? _playListsInfo;
	PlayListsInfo? _playListsList;
  VideosList? _videosList;
	String? _playListsNextPageToken;
  bool? _loading;
  String? _nextPageToken;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _nextPageToken = '';
		_playListsNextPageToken = '';
    _scrollController = ScrollController();
    _videosList = VideosList();
    _videosList?.videos = [];
		_playListsList = PlayListsInfo();
		_playListsList?.playListItems = [];
    _load();
  }

  _load() async {
    await _loadPlayListsInfo();
    setState(() {
      _loading = false;
    });
  }

	_loadPlayListsInfo() async {
		_playListsInfo = await Services.getPlaylistsInfo(
			pageToken: _playListsNextPageToken);
		_playListsNextPageToken = _playListsInfo!.nextPageToken;
    _playListsList!.playListItems!.addAll(_playListsInfo!.playListItems!);
		setState(() {});
	}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading! ? 'Loading...' : 'Ayaath Darse Quran'),
				backgroundColor: Color.fromARGB(0, 33, 48, 69),
      ),
      body: Container(
        color: Colors.blueGrey[600],
        child: Column(
          children: [
						_loading! ? CircularProgressIndicator() :
            Expanded(
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (ScrollNotification notification) {
									
                  if (_playListsList!.playListItems!.length >=
                      _playListsInfo!.pageInfo!.totalResults!) {
                    return true;
                  }
                  if (notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent) {
                    _loadPlayListsInfo();
                  }
                  return true;
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _playListsList!.playListItems!.length,
                  itemBuilder: (context, index) {
                    PlayListItem? playListItem = _playListsList!.playListItems![index];
                    return InkWell(
											onTap: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Ayaahs(playListId: playListItem.id,);
                        }));
											},
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: [
													 // CachedNetworkImage(
              //                 imageUrl: playListItem!.snippet!.thumbnails!
														// 	.thumbnailsDefault!.url!,
              //               ),
														Image.asset('assets/surahIndicatorTest.png', width: 40, height: 40),
													  SizedBox(width: 20),
                            Flexible(child: Text(playListItem!.snippet!.title!, style: TextStyle(color: Colors.white))),
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

