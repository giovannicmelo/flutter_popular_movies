import 'package:flutter_popular_movies/data/models/genre.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  double popularity;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'video')
  bool video;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'adult')
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'overview')
  String overview;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'genres')
  List<Genre> genres;

  Movie({
    this.popularity = 0.0,
    this.voteCount = 0,
    this.video = false,
    this.posterPath = "",
    this.id = 0,
    this.adult = false,
    this.backdropPath = "",
    this.originalLanguage = "",
    this.originalTitle = "",
    this.genreIds = const [],
    this.title = "",
    this.voteAverage = 0.0,
    this.overview = "",
    this.releaseDate = "",
    this.genres = const [],
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
