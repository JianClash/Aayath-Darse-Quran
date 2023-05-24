import 'dart:io';

import 'package:aayath_darse_quran/models/channel_info.dart';
import 'package:aayath_darse_quran/models/videos_list.dart';
import 'package:aayath_darse_quran/models/play_lists_info.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'keys.dart';

class Services {
  //
  static const CHANNEL_ID = 'UCsmJTENBMdUB8ISTkmfZa9A';
  static const _baseUrl = 'www.googleapis.com';

  static Future<ChannelInfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': CHANNEL_ID,
      'key': API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    // print(response.body);
    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo;
  }

	static Future<PlayListsInfo?> getPlaylistsInfo(
		{String? pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails',
      'channelId': CHANNEL_ID,
      'key': API_KEY,
			'maxResults': '50',
			'pageToken': pageToken!,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      'youtube.googleapis.com',
      '/youtube/v3/playlists',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    PlayListsInfo? playListsInfo = playListsInfoFromJson(response.body);
    return playListsInfo;
 }

  static Future<VideosList> getVideosList(
      {String? playListId, String? pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playListId!,
      'maxResults': '50',
      'pageToken': pageToken!,
      'key': API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    // print(response.body);
    VideosList videosList = videosListFromJson(response.body);
    return videosList;
  }
}

