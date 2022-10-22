import 'package:flutter/material.dart';

import 'book_grid_widget.dart';
import 'button_grid_widget.dart';
import 'search_book_text_field_widget.dart';

class GutendexWidget extends StatelessWidget {
  const GutendexWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SearchBookTextFieldWidget(),
        BookGridWidget(),
        ButtonGridWidget(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 15.0,
          ),
        ),
      ],
    );
  }
}
