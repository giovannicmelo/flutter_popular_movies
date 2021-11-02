import 'package:json_annotation/json_annotation.dart';

import '../models/movie.dart';

part 'popular.g.dart';

@JsonSerializable()
class Popular {
  int page;
  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'total_pages')
  int totalPages;
  List<Movie> results;

  Popular({
    this.page = 0,
    this.totalResults = 0,
    this.totalPages = 0,
    this.results = const [],
  });
  factory Popular.fromJson(Map<String, dynamic> json) =>
      _$PopularFromJson(json);

  Map<String, dynamic> toJson() => _$PopularToJson(this);
}
