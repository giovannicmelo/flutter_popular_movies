import '../../data/source/network/response_holder.dart';
import '../../data/models/popular.dart';
import '../../data/models/movie.dart';

abstract class MoviesDataRepository {
  Future<ResponseHolder<Popular>> getPopularMovies({int page});
  Future<ResponseHolder<Movie>> getMovie({int movieId});
}
