import 'package:flutter/foundation.dart';
import 'package:flutter_popular_movies/data/contracts/movies_data_repository.dart';
import 'package:flutter_popular_movies/data/models/movie.dart';

import '../../data/contracts/movies_data_source.dart';
import '../../data/source/network/response_holder.dart';
import '../../data/models/popular.dart';

class MoviesRepository implements MoviesDataRepository {
  final MoviesDataSource dataSource;

  const MoviesRepository({@required this.dataSource});

  @override
  Future<ResponseHolder<Popular>> getPopularMovies({int page}) async {
    return await dataSource.getPopularMovies(page: page);
  }

  @override
  Future<ResponseHolder<Movie>> getMovie({int movieId}) async {
    return await dataSource.getMovie(movieId: movieId);
  }
}
