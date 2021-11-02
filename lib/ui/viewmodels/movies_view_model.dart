import 'package:mobx/mobx.dart';

import '../../data/contracts/genres_data_repository.dart';
import '../../data/contracts/movies_data_repository.dart';
import '../../data/enums/status.dart';
import '../../data/models/genre.dart';
import '../../data/models/movie.dart';
import '../../data/models/popular.dart';
import '../../di/service_locators.dart';

part 'movies_view_model.g.dart';

class MoviesViewModel = _MoviesViewModelBase with _$MoviesViewModel;

abstract class _MoviesViewModelBase with Store {
  final _moviesRepository = serviceLocator<MoviesDataRepository>();
  final _genresRepository = serviceLocator<GenresDataRepository>();

  @observable
  Status status = Status.IDLE;

  @observable
  Exception? exception;

  @observable
  Popular movies = Popular();

  @observable
  ObservableList<Movie> paginatedMovies = ObservableList();

  @observable
  ObservableList<Genre> movieGenres = ObservableList();

  @observable
  Movie movie = Movie();

  @observable
  String genres = "";

  @action
  Future<void> fetchPopularMovies({int page = 1}) async {
    status = Status.LOADING;
    var response = await _moviesRepository.getPopularMovies(page: page);
    if (response.data != null && response.data!.totalResults > 0) {
      status = Status.SUCCESS;
      movies = response.data!;
      paginatedMovies.addAll([...response.data!.results]);
    } else {
      status = Status.ERROR;
      exception = response.exception;
    }
  }

  @action
  Future<void> fetchMovieGenres(List<int> genreIds) async {
    status = Status.LOADING;
    var response = await _genresRepository.getGenresList();
    if (response.data != null && response.data!.genres.length > 0) {
      status = Status.SUCCESS;

      movieGenres.addAll([
        ...response.data!.genres
            .where((genre) => genreIds.contains(genre.id))
            .toList()
      ]);
    } else {
      status = Status.ERROR;
      exception = response.exception;
    }
  }

  @action
  Future<void> fetchMovie(int movieId) async {
    status = Status.LOADING;
    var response = await _moviesRepository.getMovie(movieId: movieId);
    if (response.data != null && response.data!.id == movieId) {
      status = Status.SUCCESS;
      movie = response.data!;
      var genresString =
          response.data!.genres.map((item) => item.name).toList();
      genres = genresString.toString().replaceAll('[', '').replaceAll(']', '');
    } else {
      status = Status.ERROR;
      exception = response.exception;
    }
  }
}
