// To parse this JSON data, do
//
//     final popularTv = popularTvFromJson(jsonString);

import 'dart:convert';

PopularTv popularTvFromJson(String str) => PopularTv.fromJson(json.decode(str));

class PopularTv {
  PopularTv({
    this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int? page;
  List<Result> results;
  int? totalPages;
  int? totalResults;

  factory PopularTv.fromJson(Map<String, dynamic> json) => PopularTv(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class Result {
  Result({
    required this.adult,
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    required this.id,
    required this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  bool adult;
  String? backdropPath;
  DateTime? firstAirDate;
  List<int>? genreIds;
  int id;
  String name;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  double? voteAverage;
  int? voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"] ?? "No Poster Path",
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );
}
