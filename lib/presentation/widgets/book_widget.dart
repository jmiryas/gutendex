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
    return Card(
      child: Container(
        color: Colors.grey.shade200,
        padding: const EdgeInsets.all(8.0),
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
          errorWidget: (context, url, error) => Center(
            child: Image.asset(
              "assets/images/image.png",
              // fit: BoxFit.fill,
              width: 100.0,
              height: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}
