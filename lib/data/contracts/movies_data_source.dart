import '../../data/source/network/response_holder.dart';
import '../../data/models/movie.dart';
import '../../data/models/popular.dart';

abstract class MoviesDataSource {
  Future<ResponseHolder<Popular>> getPopularMovies({int page});
  Future<ResponseHolder<Movie>> getMovie({int movieId});
}
