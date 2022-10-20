part of 'gutendex_bloc.dart';

abstract class GutendexState extends Equatable {
  const GutendexState();

  @override
  List<Object> get props => [];
}

class GutendexInitialState extends GutendexState {}

class GutendexLoadingState extends GutendexState {}

class GutendexLoadedState extends GutendexState {
  final BookListModel bookList;

  const GutendexLoadedState({
    required this.bookList,
  });

  @override
  List<Object> get props => [bookList];
}

class GutendexErrorState extends GutendexState {
  final String errorMessage;

  const GutendexErrorState({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
