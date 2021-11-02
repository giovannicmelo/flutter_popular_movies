// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ApiService extends ApiService {
  _$ApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ApiService;

  Future<Response<Popular>> getPopularMovies(
      {String headers = 'application/json',
      String apiKey = Globals.API_KEY,
      String locale = 'pt-BR',
      int page = 1}) {
    final $url = '/3/movie/popular';
    final Map<String, dynamic> $params = {
      'api_key': apiKey,
      'language': locale,
      'page': page
    };
    final $headers = {'Content-Type': headers};
    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<Popular, Popular>($request);
  }

  Future<Response<Movie>> getMovie(
      {String headers = 'application/json',
      int id,
      String apiKey = Globals.API_KEY,
      String locale = 'pt-BR'}) {
    final $url = '/3/movie/${id}';
    final Map<String, dynamic> $params = {
      'api_key': apiKey,
      'language': locale
    };
    final $headers = {'Content-Type': headers};
    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<Movie, Movie>($request);
  }

  Future<Response<GenresList>> getGenresList(
      {String headers = 'application/json',
      String apiKey = Globals.API_KEY,
      String locale = 'pt-BR'}) {
    final $url = '/3/genre/movie/list';
    final Map<String, dynamic> $params = {
      'api_key': apiKey,
      'language': locale
    };
    final $headers = {'Content-Type': headers};
    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<GenresList, GenresList>($request);
  }
}
