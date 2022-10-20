import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gutendex/data/models/book_model.dart';

import '../bloc/gutendex_bloc.dart';

class GutendexPage extends StatelessWidget {
  const GutendexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Gutendex"),
      ),
      body: BlocBuilder<GutendexBloc, GutendexState>(builder: (context, state) {
        late Widget widget;

        if (state is GutendexInitialState) {
          widget = const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GutendexLoadingState) {
          widget = const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GutendexLoadedState) {
          widget = CustomScrollView(
            slivers: [
              SliverPadding(
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

                      return Container(
                        color: Colors.blueGrey.shade200,
                        child: CachedNetworkImage(
                          imageUrl: book.formats.imageJpeg,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => const Center(
                            child: SizedBox(
                              width: 20.0,
                              height: 20.0,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => const Center(
                            child: SizedBox(
                              child: Icon(Icons.error),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: state.bookList.results.length,
                  ),
                ),
              ),
            ],
          );
        } else if (state is GutendexErrorState) {
          widget = Center(
            child: Text(state.errorMessage),
          );
        }

        return widget;
      }),
    );
  }
}
