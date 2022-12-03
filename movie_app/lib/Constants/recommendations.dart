// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<Result>? recommendations;
bool recommendationsLoaded = false;

RecommendationsPage RecommendationsFromJson(String str) => RecommendationsPage.fromJson(json.decode(str));

class RecommendationsPage {
  RecommendationsPage({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory RecommendationsPage.fromJson(Map<String, dynamic> json) => RecommendationsPage(
    page: json["page"] ?? json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x)) ?? json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"] ?? json["total_pages"],
    totalResults: json["total_results"] ?? json["total_results"],
  );
}

class Result {
  Result({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String backdropPath;
  int id;
  String title;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String mediaType;
  List<int> genreIds;
  double popularity;
  bool video;
  double voteAverage;
  int voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"] ?? json["adult"],
    backdropPath: json["backdrop_path"] ?? "No Backdrop Path",
    id: json["id"] ?? json["id"],
    title: json["title"] ?? json["name"],
    originalLanguage: json["original_language"] ?? json["original_language"],
    originalTitle: json["original_title"] ?? "No Original Title",
    overview: json["overview"] ?? "No Overview",
    posterPath: json["poster_path"] ?? "Null",
    mediaType: json["media_type"] ?? json["media_type"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x) ?? json["genre_ids"].map((x) => x)),
    popularity: json["popularity"].toDouble() ?? json["popularity"].toDouble(),
    video: json["video"] ?? false,
    voteAverage: json["vote_average"].toDouble() ?? json["vote_average"].toDouble(),
    voteCount: json["vote_count"] ?? json["vote_count"],
  );
}
