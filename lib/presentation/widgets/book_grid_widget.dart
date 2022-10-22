import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_widget.dart';
import '../bloc/gutendex_bloc.dart';
import '../../data/models/book_model.dart';

class BookGridWidget extends StatelessWidget {
  const BookGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GutendexBloc, GutendexState>(builder: (context, state) {
      if (state is GutendexLoadedState) {
        return state.bookList.results.isNotEmpty
            ? SliverPadding(
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
                      BookModel book = state.bookList.results[index];

                      return BookWidget(book: book);
                    },
                    childCount: state.bookList.results.length,
                  ),
                ),
              )
            : const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text("Maaf, hasil pencarian tidak ditemukan"),
                  ),
                ),
              );
      } else {
        return const SizedBox();
      }
    });
  }
}
