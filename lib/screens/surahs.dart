import 'package:flutter/material.dart';

import 'package:aayath_darse_quran/models/play_lists_info.dart';
import 'package:aayath_darse_quran/models/videos_list.dart';

import 'package:aayath_darse_quran/utils/services.dart';

import 'package:aayath_darse_quran/screens/ayaahs.dart';

class ListSurahs extends StatefulWidget {
  @override
  _ListSurahsState createState() => _ListSurahsState();
}

class _ListSurahsState extends State<ListSurahs> {
	PlayListsInfo? _playListsInfo;
	PlayListsInfo? _playListsList;
  PlayListsInfo? surahs;
  VideosList? _videosList;
	String? _playListsNextPageToken;
  bool? _loading;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _loading = true;
		_playListsNextPageToken = '';
    _scrollController = ScrollController();
    _videosList = VideosList();
    _videosList?.videos = [];
		_playListsList = PlayListsInfo();
		_playListsList?.playListItems = [];
    surahs = PlayListsInfo();
    surahs?.playListItems = [];
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

    while (_playListsInfo!.pageInfo!.totalResults! > _playListsInfo!.pageInfo!.resultsPerPage!){
		  _playListsInfo = await Services.getPlaylistsInfo(
			  pageToken: _playListsNextPageToken);
		  _playListsNextPageToken = _playListsInfo!.nextPageToken;

		  for (var playListItem in _playListsInfo!.playListItems!){
			  if (playListItem!.snippet!.title!.substring(0, 5) == "Surah" || playListItem.snippet!.title!.substring(0, 2) == "Al" || playListItem.snippet!.title == "At" || playListItem.snippet!.title == "Aalu Imran"){
				  _playListsList!.playListItems!.add(playListItem);
			  }
		  }
    }

    surahs!.playListItems = _playListsList!.playListItems!.reversed.toList();
		setState(() {});
	}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
				centerTitle: true,
        title: Text(_loading! ? 'Loading...' : 'Ayaath Darse Quran'),
      ),

      body: Column(
        children: [
          _loading! ?  const Center(child: CircularProgressIndicator()):
          Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _playListsList!.playListItems!.length,
                itemBuilder: (context, index) {
                  PlayListItem? playListItem = surahs!.playListItems![index];
                  return InkWell(
                    onTap: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return Ayaahs(playListId: playListItem.id,);
                          })
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Image.asset('assets/surahIndicatorTest.png', width: 40, height: 40),
                          const SizedBox(width: 20),
                          Flexible(child: Text(playListItem!.snippet!.title!,)) 
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

