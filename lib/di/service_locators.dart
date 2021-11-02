import 'package:get_it/get_it.dart';

import '../data/contracts/movies_data_repository.dart';
import '../data/contracts/genres_data_repository.dart';
import '../data/contracts/movies_data_source.dart';
import '../data/contracts/genres_data_source.dart';
import '../data/repository/movies_repository.dart';
import '../data/repository/genres_repository.dart';
import '../data/source/remote/movies_remote_data_source.dart';
import '../data/source/remote/genres_remote_data_source.dart';
import '../data/source/network/api_service.dart';
import '../ui/viewmodels/movies_view_model.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  serviceLocator.registerLazySingleton<ApiService>(
    () => ApiService.create(),
  );

  serviceLocator.registerLazySingleton<MoviesDataSource>(
    () => MoviesRemoteDataSource(
      apiService: serviceLocator<ApiService>(),
    ),
  );

  serviceLocator.registerLazySingleton<GenresDataSource>(
    () => GenresRemoteDataSource(
      apiService: serviceLocator<ApiService>(),
    ),
  );

  serviceLocator.registerLazySingleton<MoviesDataRepository>(
    () => MoviesRepository(
      dataSource: serviceLocator<MoviesDataSource>(),
    ),
  );

  serviceLocator.registerLazySingleton<GenresDataRepository>(
    () => GenresRepository(
      dataSource: serviceLocator<GenresDataSource>(),
    ),
  );

  serviceLocator
      .registerLazySingleton<MoviesViewModel>(() => MoviesViewModel());
}
