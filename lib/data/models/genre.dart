import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genre {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class GenresList {
  @JsonKey(name: 'genres')
  List<Genre> genres;

  GenresList({required this.genres});

  factory GenresList.fromJson(Map<String, dynamic> json) =>
      _$GenresListFromJson(json);

  Map<String, dynamic> toJson() => _$GenresListToJson(this);
}
