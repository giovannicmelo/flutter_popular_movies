// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoviesViewModel on _MoviesViewModelBase, Store {
  final _$statusAtom = Atom(name: '_MoviesViewModelBase.status');

  @override
  Status get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(Status value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$exceptionAtom = Atom(name: '_MoviesViewModelBase.exception');

  @override
  Exception get exception {
    _$exceptionAtom.reportRead();
    return super.exception;
  }

  @override
  set exception(Exception value) {
    _$exceptionAtom.reportWrite(value, super.exception, () {
      super.exception = value;
    });
  }

  final _$moviesAtom = Atom(name: '_MoviesViewModelBase.movies');

  @override
  Popular get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(Popular value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$paginatedMoviesAtom =
      Atom(name: '_MoviesViewModelBase.paginatedMovies');

  @override
  ObservableList<Movie> get paginatedMovies {
    _$paginatedMoviesAtom.reportRead();
    return super.paginatedMovies;
  }

  @override
  set paginatedMovies(ObservableList<Movie> value) {
    _$paginatedMoviesAtom.reportWrite(value, super.paginatedMovies, () {
      super.paginatedMovies = value;
    });
  }

  final _$movieGenresAtom = Atom(name: '_MoviesViewModelBase.movieGenres');

  @override
  ObservableList<Genre> get movieGenres {
    _$movieGenresAtom.reportRead();
    return super.movieGenres;
  }

  @override
  set movieGenres(ObservableList<Genre> value) {
    _$movieGenresAtom.reportWrite(value, super.movieGenres, () {
      super.movieGenres = value;
    });
  }

  final _$movieAtom = Atom(name: '_MoviesViewModelBase.movie');

  @override
  Movie get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(Movie value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  final _$genresAtom = Atom(name: '_MoviesViewModelBase.genres');

  @override
  String get genres {
    _$genresAtom.reportRead();
    return super.genres;
  }

  @override
  set genres(String value) {
    _$genresAtom.reportWrite(value, super.genres, () {
      super.genres = value;
    });
  }

  final _$fetchPopularMoviesAsyncAction =
      AsyncAction('_MoviesViewModelBase.fetchPopularMovies');

  @override
  Future<void> fetchPopularMovies({int page = 1}) {
    return _$fetchPopularMoviesAsyncAction
        .run(() => super.fetchPopularMovies(page: page));
  }

  final _$fetchMovieGenresAsyncAction =
      AsyncAction('_MoviesViewModelBase.fetchMovieGenres');

  @override
  Future<void> fetchMovieGenres(List<int> genreIds) {
    return _$fetchMovieGenresAsyncAction
        .run(() => super.fetchMovieGenres(genreIds));
  }

  final _$fetchMovieAsyncAction =
      AsyncAction('_MoviesViewModelBase.fetchMovie');

  @override
  Future<void> fetchMovie(int movieId) {
    return _$fetchMovieAsyncAction.run(() => super.fetchMovie(movieId));
  }

  @override
  String toString() {
    return '''
status: ${status},
exception: ${exception},
movies: ${movies},
paginatedMovies: ${paginatedMovies},
movieGenres: ${movieGenres},
movie: ${movie},
genres: ${genres}
    ''';
  }
}
