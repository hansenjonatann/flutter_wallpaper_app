// To parse this JSON data, do
//
//     final wallpaperCollectionModel = wallpaperCollectionModelFromJson(jsonString);

import 'dart:convert';

WallpaperCollectionModel wallpaperCollectionModelFromJson(String str) =>
    WallpaperCollectionModel.fromJson(json.decode(str));

String wallpaperCollectionModelToJson(WallpaperCollectionModel data) =>
    json.encode(data.toJson());

class WallpaperCollectionModel {
  String? id;
  String? title;
  String? description;
  bool? private;
  int? mediaCount;
  int? photosCount;
  int? videosCount;

  WallpaperCollectionModel({
    this.id,
    this.title,
    this.description,
    this.private,
    this.mediaCount,
    this.photosCount,
    this.videosCount,
  });

  factory WallpaperCollectionModel.fromJson(Map<String, dynamic> json) =>
      WallpaperCollectionModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        private: json["private"],
        mediaCount: json["media_count"],
        photosCount: json["photos_count"],
        videosCount: json["videos_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "private": private,
        "media_count": mediaCount,
        "photos_count": photosCount,
        "videos_count": videosCount,
      };
}
