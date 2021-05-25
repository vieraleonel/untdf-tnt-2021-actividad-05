import 'dart:convert';

import 'package:actividad_05/models/thumbnail.dart';
import 'package:actividad_05/models/marvel_url.dart';
import 'package:actividad_05/utils/enum_values.dart';

class Character {
  Character({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceUri,
    // this.comics,
    // this.series,
    // this.stories,
    // this.events,
    this.urls,
  });

  int id;
  String name;
  String description;
  String modified;
  Thumbnail thumbnail;
  String resourceUri;
  // Comics comics;
  // Comics series;
  // Stories stories;
  // Comics events;
  List<MarvelUrl> urls;

  factory Character.fromRawJson(String str) =>
      Character.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        // comics: Comics.fromJson(json["comics"]),
        // series: Comics.fromJson(json["series"]),
        // stories: Stories.fromJson(json["stories"]),
        // events: Comics.fromJson(json["events"]),
        urls: List<MarvelUrl>.from(
            json["urls"].map((x) => MarvelUrl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail.toJson(),
        "resourceURI": resourceUri,
        // "comics": comics.toJson(),
        // "series": series.toJson(),
        // "stories": stories.toJson(),
        // "events": events.toJson(),
        "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
      };
}
