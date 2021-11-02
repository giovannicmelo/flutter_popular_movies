import 'package:flutter/foundation.dart';
import 'package:flutter_popular_movies/data/models/movie.dart';

import '../../../data/contracts/movies_data_source.dart';
import '../../../data/source/network/api_service.dart';
import '../../../data/source/network/response_holder.dart';
import '../../../data/models/popular.dart';

class MoviesRemoteDataSource implements MoviesDataSource {
  final ApiService apiService;

  const MoviesRemoteDataSource({@required this.apiService});

  @override
  Future<ResponseHolder<Popular>> getPopularMovies({int page}) async {
    try {
      final response = await apiService.getPopularMovies(page: page);

      if (response.isSuccessful) {
        return ResponseHolder(
          statusCode: response.statusCode,
          data: response.body,
        );
      } else {
        return ResponseHolder(
          statusCode: response.statusCode,
          data: response.body,
          exception: Exception(response.bodyString),
        );
      }
    } on Exception catch (e) {
      print('Error: $e');
      return ResponseHolder(
        statusCode: -1,
        exception: e,
      );
    }
  }

  @override
  Future<ResponseHolder<Movie>> getMovie({int movieId}) async {
    try {
      final response = await apiService.getMovie(id: movieId);

      if (response.isSuccessful) {
        return ResponseHolder(
          statusCode: response.statusCode,
          data: response.body,
        );
      } else {
        return ResponseHolder(
          statusCode: response.statusCode,
          data: response.body,
          exception: Exception(response.bodyString),
        );
      }
    } on Exception catch (e) {
      print('Error: $e');
      return ResponseHolder(
        statusCode: -1,
        exception: e,
      );
    }
  }
}
