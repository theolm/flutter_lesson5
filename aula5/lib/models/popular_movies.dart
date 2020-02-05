// To parse this JSON data, do
//
//     final popularMovies = popularMoviesFromJson(jsonString);

import 'dart:convert';

PopularMovies popularMoviesFromJson(String str) => PopularMovies.fromJson(json.decode(str));

String popularMoviesToJson(PopularMovies data) => json.encode(data.toJson());

class PopularMovies {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<PopularMovie> results;

  PopularMovies({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  factory PopularMovies.fromJson(Map<String, dynamic> json) => PopularMovies(
    page: json["page"],
    totalResults: json["total_results"],
    totalPages: json["total_pages"],
    results: List<PopularMovie>.from(json["results"].map((x) => PopularMovie.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "total_results": totalResults,
    "total_pages": totalPages,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class PopularMovie {
  final double popularity;
  final int voteCount;
  final bool video;
  final String posterPath;
  final int id;
  final bool adult;
  final String backdropPath;
  final OriginalLanguage originalLanguage;
  final String originalTitle;
  final List<int> genreIds;
  final String title;
  final double voteAverage;
  final String overview;
  final DateTime releaseDate;

  PopularMovie({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  factory PopularMovie.fromJson(Map<String, dynamic> json) => PopularMovie(
    popularity: json["popularity"].toDouble(),
    voteCount: json["vote_count"],
    video: json["video"],
    posterPath: json["poster_path"],
    id: json["id"],
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    originalLanguage: originalLanguageValues.map[json["original_language"]],
    originalTitle: json["original_title"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    title: json["title"],
    voteAverage: json["vote_average"].toDouble(),
    overview: json["overview"],
    releaseDate: DateTime.parse(json["release_date"]),
  );

  Map<String, dynamic> toJson() => {
    "popularity": popularity,
    "vote_count": voteCount,
    "video": video,
    "poster_path": posterPath,
    "id": id,
    "adult": adult,
    "backdrop_path": backdropPath,
    "original_language": originalLanguageValues.reverse[originalLanguage],
    "original_title": originalTitle,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "title": title,
    "vote_average": voteAverage,
    "overview": overview,
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
  };

  String getMoviePoster() => 'http://image.tmdb.org/t/p/w500/' + posterPath;
}

enum OriginalLanguage { EN, DA, JA, RU }

final originalLanguageValues = EnumValues({
  "da": OriginalLanguage.DA,
  "en": OriginalLanguage.EN,
  "ja": OriginalLanguage.JA,
  "ru": OriginalLanguage.RU
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
