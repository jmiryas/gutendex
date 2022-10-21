import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/gutendex_bloc.dart';
import '../widgets/gutendex_widget.dart';

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
          widget = GutendexWidget(
            books: state.bookList.results,
            previousUrl: state.bookList.previous,
            nextUrl: state.bookList.next,
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
