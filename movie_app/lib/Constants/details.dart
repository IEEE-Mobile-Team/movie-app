// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Result>? details;
bool detailsLoaded = false;

Detailspage detailsFromJson(String str) =>
    Detailspage.fromJson(json.decode(str));

class Detailspage {
  Detailspage({
    required this.results,
  });

  List<Result> results;

  factory Detailspage.fromJson(Map<String, dynamic> json) => Detailspage(
        results: List<Result>.from(json["cast"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  Result({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownfordepartment,
    required this.name,
    required this.originalname,
    required this.popularity,
    required this.path,
    required this.castid,
    required this.character,
    required this.creditid,
    required this.order,
  });

  bool adult;
  int gender;
  int id;
  String knownfordepartment;
  String name;
  String originalname;
  String path;
  int castid;
  double popularity;
  String character;
  String creditid;
  int order;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
      adult: json["adult"],
      gender: json["gender"],
      id: json["id"],
      knownfordepartment: json["known_for_department"],
      name: json["name"],
      originalname: json["original_name"],
      popularity: json["popularity"].toDouble(),
      path: json["profile_path"] ?? "No Profile Pic",
      castid: json["cast_id"] ?? 0,
      character: json["character"],
      creditid: json["credit_id"],
      order: json["order"]);
}
