import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../data/models/book_model.dart';

class BookWidget extends StatelessWidget {
  final BookModel book;

  const BookWidget({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
