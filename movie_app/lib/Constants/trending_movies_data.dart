// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Result>? movies;
bool moviesLoaded = false;

MoviePage moviesFromJson(String str) => MoviePage.fromJson(json.decode(str));

class MoviePage {
  MoviePage({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory MoviePage.fromJson(Map<String, dynamic> json) => MoviePage(
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
    required this.releaseDate,
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
  DateTime releaseDate;
  bool video;
  double voteAverage;
  int voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"] ?? json["adult"],
    backdropPath: json["backdrop_path"] ?? json["backdrop_path"],
    id: json["id"] ?? json["id"],
    title: json["title"] ?? json["title"],
    originalLanguage: json["original_language"] ?? json["original_language"],
    originalTitle: json["original_title"] ?? json["original_title"],
    overview: json["overview"] ?? json["overview"],
    posterPath: json["poster_path"] ?? json["poster_path"],
    mediaType: json["media_type"] ?? json["media_type"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x) ?? json["genre_ids"].map((x) => x)),
    popularity: json["popularity"].toDouble() ?? json["popularity"].toDouble(),
    releaseDate: DateTime.parse(json["release_date"]),
    video: json["video"] ?? json["video"],
    voteAverage: json["vote_average"].toDouble() ?? json["vote_average"].toDouble(),
    voteCount: json["vote_count"] ?? json["vote_count"],
  );
}
