import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../../data/models/booklist_model.dart';
import '../repositories/gutendex_repository.dart';

class GetBooksByQueryUseCase implements UseCase<BookListModel, Params> {
  final GutendexRepository gutendexRepository;

  GetBooksByQueryUseCase({
    required this.gutendexRepository,
  });

  @override
  Future<Either<Failure, BookListModel>> call(Params params) async {
    return await gutendexRepository.getBooksByQuery(params.query);
  }
}

class Params extends Equatable {
  final String query;

  const Params({
    required this.query,
  });

  @override
  List<Object> get props => [query];
}
