import 'package:dartz/dartz.dart';

import '../models/booklist_model.dart';
import '../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../datasources/gutendex_remote_data_source.dart';
import '../../domain/repositories/gutendex_repository.dart';

class GutendexRepositoryImplementation implements GutendexRepository {
  final GutendexRemoteDataSource gutendexRemoteDataSource;
  final NetworkInfo networkInfo;

  GutendexRepositoryImplementation({
    required this.gutendexRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, BookListModel>> getBooksByQuery(String query) async {
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      final bookList = await gutendexRemoteDataSource.getBooksByQuery(query);

      return Right(bookList);
    } else {
      return Left(ServerFailure());
    }
  }
}
