import '../../data/source/network/response_holder.dart';
import '../../data/models/genre.dart';

abstract class GenresDataRepository {
  Future<ResponseHolder<GenresList>> getGenresList();
}
