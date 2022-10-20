part of 'gutendex_bloc.dart';

abstract class GutendexEvent extends Equatable {
  const GutendexEvent();

  @override
  List<Object> get props => [];
}

class GutendexGetBookByQueryEvent extends GutendexEvent {
  final String query;

  const GutendexGetBookByQueryEvent({
    required this.query,
  });

  @override
  List<Object> get props => [query];
}
