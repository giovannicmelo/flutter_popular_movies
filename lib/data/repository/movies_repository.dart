import 'package:flutter_popular_movies/data/contracts/movies_data_repository.dart';
import 'package:flutter_popular_movies/data/models/movie.dart';

import '../../data/contracts/movies_data_source.dart';
import '../../data/models/popular.dart';
import '../../data/source/network/response_holder.dart';

class MoviesRepository implements MoviesDataRepository {
  final MoviesDataSource dataSource;

  const MoviesRepository({required this.dataSource});

  @override
  Future<ResponseHolder<Popular>> getPopularMovies({int page = 0}) async {
    return await dataSource.getPopularMovies(page: page);
  }

  @override
  Future<ResponseHolder<Movie>> getMovie({int movieId = 0}) async {
    return await dataSource.getMovie(movieId: movieId);
  }
}
