// To parse this JSON data, do
//
//     final playListsInfo = playListsInfoFromJson(jsonString);
// To parse this JSON data, do
//
//     final playListsInfo = playListsInfoFromJson(jsonString);

import 'dart:convert';

PlayListsInfo? playListsInfoFromJson(String str) => PlayListsInfo.fromJson(json.decode(str));

String playListsInfoToJson(PlayListsInfo? data) => json.encode(data!.toJson());

class PlayListsInfo {
    PlayListsInfo({
        this.kind,
        this.etag,
        this.nextPageToken,
        this.pageInfo,
        this.playListItems,
    });

    String? kind;
    String? etag;
    String? nextPageToken;
    PageInfo? pageInfo;
    List<PlayListItem?>? playListItems;

    factory PlayListsInfo.fromJson(Map<String, dynamic> json) => PlayListsInfo(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        //playListItems: json["items"] == null ? [] : List<PlayListItem?>.from(json["items"]!.map((x) => PlayListItem.fromJson(x)))
        playListItems: List<PlayListItem?>.from(json["items"]!.map((x) => PlayListItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "nextPageToken": nextPageToken,
        "pageInfo": pageInfo!.toJson(),
        //"items": playListItems == null ? [] : List<dynamic>.from(playListItems!.map((x) => x!.toJson())),
        "items": List<dynamic>.from(playListItems!.map((x) => x!.toJson())),
    };
}

class PlayListItem {
    PlayListItem({
        this.kind,
        this.etag,
        this.id,
        this.snippet,
        this.contentDetails,
    });

    String? kind;
    String? etag;
    String? id;
    Snippet? snippet;
    ContentDetails? contentDetails;

    factory PlayListItem.fromJson(Map<String, dynamic> json) => PlayListItem(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
        contentDetails: ContentDetails.fromJson(json["contentDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet!.toJson(),
        "contentDetails": contentDetails!.toJson(),
    };
}

class ContentDetails {
    ContentDetails({
        this.itemCount,
    });

    int? itemCount;

    factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        itemCount: json["itemCount"],
    );

    Map<String, dynamic> toJson() => {
        "itemCount": itemCount,
    };
}

class Snippet {
    Snippet({
        this.publishedAt,
        this.channelId,
        this.title,
        this.description,
        this.thumbnails,
        this.channelTitle,
        this.localized,
    });

    DateTime? publishedAt;
    String? channelId;
    String? title;
    String? description;
    Thumbnails? thumbnails;
    String? channelTitle;
    Localized? localized;

    factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        localized: Localized.fromJson(json["localized"]),
    );

    Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt?.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails!.toJson(),
        "channelTitle": channelTitle,
        "localized": localized!.toJson(),
    };
}

class Localized {
    Localized({
        this.title,
        this.description,
    });

    String? title;
    String? description;

    factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
    };
}

class Thumbnails {
    Thumbnails({
        this.thumbnailsDefault,
        this.medium,
        this.high,
        this.standard,
        this.maxres,
    });

    Default? thumbnailsDefault;
    Default? medium;
    Default? high;
    Default? standard;
    Default? maxres;

    factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
        standard: Default.fromJson(json["standard"]),
        maxres: Default.fromJson(json["maxres"]),
    );

    Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault!.toJson(),
        "medium": medium!.toJson(),
        "high": high!.toJson(),
        "standard": standard!.toJson(),
        "maxres": maxres!.toJson(),
    };
}

class Default {
    Default({
        this.url,
        this.width,
        this.height,
    });

    String? url;
    int? width;
    int? height;

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
