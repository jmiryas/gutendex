import 'package:flutter/material.dart';

import 'book_widget.dart';
import '../../data/models/book_model.dart';

class BookGridWidget extends StatelessWidget {
  final List<BookModel> books;
  const BookGridWidget({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 200,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            BookModel book = books[index];

            return BookWidget(book: book);
          },
          childCount: books.length,
        ),
      ),
    );
  }
}
