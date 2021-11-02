import '../../../data/contracts/genres_data_source.dart';
import '../../../data/models/genre.dart';
import '../../../data/source/network/api_service.dart';
import '../../../data/source/network/response_holder.dart';

class GenresRemoteDataSource implements GenresDataSource {
  final ApiService apiService;

  const GenresRemoteDataSource({required this.apiService});

  @override
  Future<ResponseHolder<GenresList>> getGenresList() async {
    try {
      final response = await apiService.getGenresList();

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
