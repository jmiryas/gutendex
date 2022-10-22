import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'button_widget.dart';
import '../bloc/gutendex_bloc.dart';

class ButtonGridWidget extends StatelessWidget {
  const ButtonGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<GutendexBloc, GutendexState>(
        builder: ((context, state) {
          if (state is GutendexInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GutendexLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GutendexLoadedState) {
            return state.bookList.results.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        state.bookList.previous.isNotEmpty
                            ? Expanded(
                                child: ButtonWidget(
                                    onTap: () {
                                      BlocProvider.of<GutendexBloc>(context)
                                          .add(
                                        GutendexGetBookByQueryEvent(
                                          query: state.bookList.previous,
                                        ),
                                      );
                                    },
                                    label: "Sebelumnya"),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          width: 10.0,
                        ),
                        state.bookList.next.isNotEmpty
                            ? Expanded(
                                child: ButtonWidget(
                                    onTap: () {
                                      BlocProvider.of<GutendexBloc>(context)
                                          .add(
                                        GutendexGetBookByQueryEvent(
                                          query: state.bookList.next,
                                        ),
                                      );
                                    },
                                    label: "Selanjutnya"),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )
                : const SizedBox();
          } else if (state is GutendexErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const Center(
              child: Text("Maaf, terjadi error!"),
            );
          }
        }),
      ),
    );
  }
}
