import 'package:flutter/material.dart';
import 'package:language_picker/languages.dart';
import 'package:url_launcher/url_launcher.dart';

import 'alert_dialog_widget.dart';
import '../../data/models/book_model.dart';
import '../../core/constants/constants.dart';

class BookDescriptionWidget extends StatelessWidget {
  final BookModel book;
  const BookDescriptionWidget({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialogWidget(
      title: "Deskripsi Buku",
      height: 200.0,
      children: [
        ListTile(
          title: Text(book.title),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: book.authors.map((author) {
              return Text(author.name);
            }).toList(),
          ),
        ),
        ListTile(
          title: const Text("Bahasa"),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: book.languages.map((language) {
              return Text(Language.fromIsoCode(language).name);
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        ElevatedButton.icon(
          onPressed: () async {
            await launchUrl(Uri.parse("$gutenbergApi${book.id}"));
          },
          icon: const Icon(Icons.download),
          label: const Text("Download"),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(40.0),
          ),
        ),
      ],
    );
  }
}
