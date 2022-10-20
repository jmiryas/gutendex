import 'book_model.dart';
import '../../domain/entities/booklist_entity.dart';

class BookListModel extends BookListEntity {
  final List<BookModel> results;

  BookListModel({
    required super.count,
    required super.next,
    required super.previous,
    required this.results,
  });

  factory BookListModel.fromJson(Map<String, dynamic> json) {
    return BookListModel(
      count: json["count"],
      next: json["next"] ?? "",
      previous: json["previous"] ?? "",
      results: _getResults(json["results"]),
    );
  }

  static _getResults(List<dynamic> results) {
    final List<BookModel> books = [];

    for (var book in results) {
      books.add(BookModel.fromJson(book));
    }

    return books;
  }
}
