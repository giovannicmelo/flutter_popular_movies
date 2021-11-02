import 'package:flutter_popular_movies/data/contracts/genres_data_repository.dart';

import '../../data/contracts/genres_data_source.dart';
import '../../data/models/genre.dart';
import '../../data/source/network/response_holder.dart';

class GenresRepository implements GenresDataRepository {
  final GenresDataSource dataSource;

  const GenresRepository({required this.dataSource});

  @override
  Future<ResponseHolder<GenresList>> getGenresList() async {
    return await dataSource.getGenresList();
  }
}
