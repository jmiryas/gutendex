import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutendex/presentation/bloc/gutendex_bloc.dart';

import 'book_grid_widget.dart';
import '../../data/models/book_model.dart';

class GutendexWidget extends StatelessWidget {
  final String previousUrl;
  final String nextUrl;
  final List<BookModel> books;

  const GutendexWidget({
    Key? key,
    required this.books,
    required this.previousUrl,
    required this.nextUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BookGridWidget(books: books),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: previousUrl.isNotEmpty
                    ? () {
                        BlocProvider.of<GutendexBloc>(context).add(
                          GutendexGetBookByQueryEvent(query: previousUrl),
                        );
                      }
                    : null,
                child: const Text("Prev"),
              ),
              const SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                onPressed: nextUrl.isNotEmpty
                    ? () {
                        BlocProvider.of<GutendexBloc>(context).add(
                          GutendexGetBookByQueryEvent(query: nextUrl),
                        );
                      }
                    : null,
                child: const Text("Next"),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 15.0,
          ),
        ),
      ],
    );
  }
}
