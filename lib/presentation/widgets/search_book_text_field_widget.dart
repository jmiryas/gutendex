import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/gutendex_bloc.dart';
import '../../core/constants/constants.dart';

class SearchBookTextFieldWidget extends StatelessWidget {
  const SearchBookTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Cari buku ...",
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none,
            ),
          ),
          onSubmitted: ((value) {
            BlocProvider.of<GutendexBloc>(context).add(
              GutendexGetBookByQueryEvent(
                  query: "$gutendexSearchBookApi$value"),
            );
          }),
        ),
      ),
    );
  }
}
