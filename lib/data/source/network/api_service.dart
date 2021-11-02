import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter_popular_movies/data/models/genre.dart';
import 'package:flutter_popular_movies/data/models/movie.dart';
import 'package:http/io_client.dart' as http;

import './json_to_type_converter.dart';
import '../../../configs/globals.dart';
import '../../../data/models/popular.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/3')
abstract class ApiService extends ChopperService {
  static const int _TIMEOUT = 20;

  @Get(path: '/movie/popular')
  Future<Response<Popular>> getPopularMovies({
    @Header('Content-Type') String headers = 'application/json',
    @Query('api_key') String apiKey = Globals.API_KEY,
    @Query('language') String locale = 'pt-BR',
    @Query('page') int page = 1,
  });

  @Get(path: '/movie/{id}')
  Future<Response<Movie>> getMovie({
    @Header('Content-Type') String headers = 'application/json',
    @Path('id') int id = 0,
    @Query('api_key') String apiKey = Globals.API_KEY,
    @Query('language') String locale = 'pt-BR',
  });

  @Get(path: '/genre/movie/list')
  Future<Response<GenresList>> getGenresList({
    @Header('Content-Type') String headers = 'application/json',
    @Query('api_key') String apiKey = Globals.API_KEY,
    @Query('language') String locale = 'pt-BR',
  });

  static ApiService create() {
    final client = _createChopperClient();
    return _$ApiService(client);
  }

  static http.IOClient _createHttpClient() {
    return http.IOClient(
      HttpClient()..connectionTimeout = const Duration(seconds: _TIMEOUT),
    );
  }

  static ChopperClient _createChopperClient() {
    return ChopperClient(
      baseUrl: Globals.BASE_URL,
      client: _createHttpClient(),
      services: [
        _$ApiService(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
        HeadersInterceptor({'Content-Type': 'application/json'}),
      ],
      converter: JsonToTypeConverter({
        Popular: (json) => Popular.fromJson(json),
        Movie: (json) => Movie.fromJson(json),
        GenresList: (json) => GenresList.fromJson(json),
      }),
      errorConverter: JsonConverter(),
    );
  }
}
