import 'dart:convert';

import 'package:feed/model/tags.dart';

List<MyData> myDataFromJson(String str) =>
    List<MyData>.from(json.decode(str).map((x) => MyData.fromJson(x)));

String myDataToJson(List<MyData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyData {
  MyData({
    required this.id,
    required this.createdAt,
    required this.authorId,
    required this.description,
    required this.defaultPhotoUrl,
    required this.myDatumTags,
    required this.authorUsername,
    required this.authorFullName,
    required this.placeName,
    required this.placeLocationName,
    required this.authorPhotoUrl,
    required this.photoUrls,
    required this.tags,
  });

  String id;
  DateTime createdAt;
  String authorId;
  String description;
  String defaultPhotoUrl;
  List<Tags> myDatumTags;
  String authorUsername;
  String authorFullName;
  String placeName;
  String placeLocationName;
  String authorPhotoUrl;
  List<String> photoUrls;
  List<dynamic> tags;

  factory MyData.fromJson(Map<String, dynamic> json) => MyData(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    authorId: json["authorId"],
    description: json["description"],
    defaultPhotoUrl: json["defaultPhotoUrl"],
    myDatumTags:
    List<Tags>.from(json["tags_"].map((x) => Tags.fromJson(x))),
    authorUsername: json["authorUsername"],
    authorFullName: json["authorFullName"],
    placeName: json["placeName"],
    placeLocationName: json["placeLocationName"],
    authorPhotoUrl: json["authorPhotoUrl"],
    photoUrls: List<String>.from(json["photoUrls"].map((x) => x)),
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "authorId": authorId,
    "description": description,
    "defaultPhotoUrl": defaultPhotoUrl,
    "tags_": List<dynamic>.from(myDatumTags.map((x) => x.toJson())),
    "authorUsername": authorUsername,
    "placeName": placeName,
    "authorPhotoUrl": authorPhotoUrl,
    "photoUrls": List<dynamic>.from(photoUrls.map((x) => x)),
    "tags": List<dynamic>.from(tags.map((x) => x)),
  };
}
