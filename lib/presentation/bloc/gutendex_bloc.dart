import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/constants/constants.dart';
import '../../data/models/booklist_model.dart';
import '../../domain/usecases/get_books_by_query.dart';

part 'gutendex_event.dart';
part 'gutendex_state.dart';

class GutendexBloc extends Bloc<GutendexEvent, GutendexState> {
  final GetBooksByQueryUseCase getBooksByQueryUseCase;

  GutendexBloc({
    required this.getBooksByQueryUseCase,
  }) : super(GutendexInitialState()) {
    on<GutendexGetBookByQueryEvent>(_getGutendexBooksByQuery);
  }

  void _getGutendexBooksByQuery(
      GutendexGetBookByQueryEvent event, Emitter<GutendexState> emit) async {
    emit(GutendexLoadingState());

    final String query = event.query;

    final getBooksByQueryEither = await getBooksByQueryUseCase(
      Params(
        query: query,
      ),
    );

    await getBooksByQueryEither.fold(
      (failure) async => emit(
        GutendexErrorState(
          errorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (bookList) async => emit(
        GutendexLoadedState(bookList: bookList),
      ),
    );
  }

  // Map error message.

  String _mapFailureToMessage(Failure failure) {
    late final String failureMessage;

    switch (failure.runtimeType) {
      case ServerFailure:
        failureMessage = serverFailureMessage;
        break;
      default:
        failureMessage = "Unexpected error";
        break;
    }

    return failureMessage;
  }
}
