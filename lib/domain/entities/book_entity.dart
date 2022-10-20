class BookEntity {
  final int id;
  final String title;
  final List<dynamic> translators;
  final List<String> subjects;
  final List<dynamic> bookshelves;
  final List<String> languages;
  final bool copyright;
  final String mediaType;
  final int downloadCount;

  BookEntity({
    required this.id,
    required this.title,
    required this.translators,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    required this.copyright,
    required this.mediaType,
    required this.downloadCount,
  });
}

class AuthorEntity {
  final String name;
  final int birthYear;
  final int deathYear;

  AuthorEntity({
    required this.name,
    required this.birthYear,
    required this.deathYear,
  });
}

class FormatsEntity {
  final String textHtmlCharsetIso88591;
  final String textPlainCharsetUsAscii;
  final String imageJpeg;
  final String textPlain;
  final String applicationRdfXml;
  final String applicationEpubZip;
  final String applicationXMobipocketEbook;
  final String textHtml;

  FormatsEntity({
    required this.textHtmlCharsetIso88591,
    required this.textPlainCharsetUsAscii,
    required this.imageJpeg,
    required this.textPlain,
    required this.applicationRdfXml,
    required this.applicationEpubZip,
    required this.applicationXMobipocketEbook,
    required this.textHtml,
  });
}
