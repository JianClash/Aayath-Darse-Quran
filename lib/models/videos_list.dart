// To parse this JSON data, do
//
//     final videosList = videosListFromJson(jsonString);
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'videos_list.g.dart';


VideosList videosListFromJson(String str) =>
    VideosList.fromJson(json.decode(str));

String videosListToJson(VideosList data) => json.encode(data.toJson());

class VideosList {
  VideosList({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.videos,
    this.pageInfo,
  });

  String? kind;
  String? etag;
  String? nextPageToken;
  List<VideoItem>? videos;
  PageInfo? pageInfo;

  factory VideosList.fromJson(Map<String, dynamic> json) => VideosList(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        videos: List<VideoItem>.from(
            json["items"].map((x) => VideoItem.fromJson(x))),
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "nextPageToken": nextPageToken,
        "items": List<dynamic>.from(videos!.map((x) => x.toJson())),
        "pageInfo": pageInfo!.toJson(),
      };
}

@HiveType(typeId: 1, adapterName: 'VideoItemAdapter')
class VideoItem {
  @HiveField(0)
  String? kind;

  @HiveField(1)
  String? etag;

  @HiveField(2)
  String? id;

  @HiveField(3)
  Video? video;

  VideoItem({
    this.kind,
    this.etag,
    this.id,
    this.video,
  });

  factory VideoItem.fromJson(Map<String, dynamic> json) => VideoItem(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        video: Video.fromJson(json["snippet"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": video!.toJson(),
      };
}

@HiveType(typeId: 2, adapterName: 'VideoAdapter')
class Video {
  @HiveField(0)
  DateTime? publishedAt;

  @HiveField(1)
  String? channelId;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? description;

  @HiveField(4)
  Thumbnails? thumbnails;

  @HiveField(5)
  String? channelTitle;

  @HiveField(6)
  String? playlistId;

  @HiveField(7)
  int? position;

  @HiveField(8)
  ResourceId? resourceId;

  Video({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.playlistId,
    this.position,
    this.resourceId,
  });


  factory Video.fromJson(Map<String, dynamic> json) => Video(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        playlistId: json["playlistId"],
        position: json["position"],
        resourceId: ResourceId.fromJson(json["resourceId"]),
      );

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt!.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails!.toJson(),
        "channelTitle": channelTitle,
        "playlistId": playlistId,
        "position": position,
        "resourceId": resourceId!.toJson(),
      };
}


@HiveType(typeId: 3, adapterName: 'ResourceIdAdapter')
class ResourceId {
  @HiveField(0)
  String? kind;

  @HiveField(1)
  String? videoId;

  ResourceId({
    this.kind,
    this.videoId,
  });


  factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
        kind: json["kind"],
        videoId: json["videoId"],
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "videoId": videoId,
      };
}

@HiveType(typeId: 4, adapterName: 'ThumbnailsAdapter')
class Thumbnails {
  @HiveField(0)
  Default? thumbnailsDefault;

  @HiveField(1)
  Default? medium;

  @HiveField(2)
  Default? high;

  @HiveField(3)
  Default? standard;

  @HiveField(4)
  Default? maxres;

  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
        standard: null == json["standard"]
            ? null
            : Default.fromJson(json["standard"]),
        maxres:
            null == json["maxres"] ? null : Default.fromJson(json["maxres"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault!.toJson(),
        "medium": medium!.toJson(),
        "high": high!.toJson(),
        "standard": standard!.toJson(),
        "maxres": maxres!.toJson(),
      };
}



@HiveType(typeId: 5, adapterName: 'DefaultAdapter')
class Default {
  @HiveField(0)
  String? url;

  @HiveField(1)
  int? width;

  @HiveField(2)
  int? height;

  Default({
    this.url,
    this.width,
    this.height,
  });


  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  int? totalResults;
  int? resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
  };
}

