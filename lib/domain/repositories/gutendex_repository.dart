import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/models/booklist_model.dart';

abstract class GutendexRepository {
  Future<Either<Failure, BookListModel>> getBooksByQuery(String query);
}
