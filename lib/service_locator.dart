import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
import 'presentation/bloc/gutendex_bloc.dart';
import 'domain/usecases/get_books_by_query.dart';
import 'domain/repositories/gutendex_repository.dart';
import 'data/datasources/gutendex_remote_data_source.dart';
import 'data/repositories/gutendex_repository_implementation.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeServiceLocator() async {
  // Bloc

  serviceLocator.registerFactory(
    () => GutendexBloc(
      getBooksByQueryUseCase: serviceLocator(),
    ),
  );

  // Get books by query

  serviceLocator.registerLazySingleton(
    () => GetBooksByQueryUseCase(
      gutendexRepository: serviceLocator(),
    ),
  );

  // Gutendex repository

  serviceLocator.registerLazySingleton<GutendexRepository>(
    () => GutendexRepositoryImplementation(
      gutendexRemoteDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );

  // Remote dan network info

  serviceLocator.registerLazySingleton<GutendexRemoteDataSource>(
    () => GutendexRemoteDataSourceImplementation(
      client: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplementation(
      dataConnectionChecker: serviceLocator(),
    ),
  );

  // Client dan data connection checker

  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
