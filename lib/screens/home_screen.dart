import 'package:flutter/material.dart';

import 'package:aayath_darse_quran/models/play_lists_info.dart';
import 'package:aayath_darse_quran/models/channel_info.dart';
import 'package:aayath_darse_quran/models/videos_list.dart';

import 'package:aayath_darse_quran/utils/services.dart';

import 'package:aayath_darse_quran/screens/ayaahs.dart';
import 'package:aayath_darse_quran/screens/navigation_drawer.dart' as Drawer;

// import 'package:cached_network_image/cached_network_image.dart';

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
		for (var playListItem in _playListsInfo!.playListItems!){
			if (playListItem!.snippet!.title!.substring(0, 5) == "Surah" || playListItem.snippet!.title!.substring(0, 2) == "Al" || playListItem.snippet!.title == "At" || playListItem.snippet!.title == "Aalu Imran"){
				_playListsList!.playListItems!.add(playListItem);
			}
		}
		setState(() {});
	}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
				centerTitle: true,
        title: Text(_loading! ? 'Loading...' : 'Ayaath Darse Quran'),
      ),
      body: Container(
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
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
														Image.asset('assets/surahIndicatorTest.png', width: 40, height: 40),
													  const SizedBox(width: 20),
                            Flexible(child: Text(playListItem!.snippet!.title!,)) //style: TextStyle(color: Colors.white))),
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
			drawer: const Drawer.NavigationDrawer(),
    );
  }
}

