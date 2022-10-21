import '../../domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  final List<AuthorModel> authors;
  final FormatsModel formats;

  BookModel({
    required super.id,
    required super.title,
    required this.authors,
    required super.translators,
    required super.subjects,
    required super.bookshelves,
    required super.languages,
    required super.copyright,
    required super.mediaType,
    required this.formats,
    required super.downloadCount,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json["id"],
      title: json["title"],
      authors: _getAuthors(json["authors"]),
      translators: json["translators"],
      subjects: _getStringList(json["subjects"]),
      bookshelves: json["bookshelves"],
      languages: _getStringList(json["languages"]),
      copyright: json["copyright"] ?? "",
      mediaType: json["mediaType"] ?? "",
      formats: FormatsModel.fromJson(json["formats"]),
      downloadCount: json["downloadCount"] ?? 0,
    );
  }

  static _getAuthors(List<dynamic> authors) {
    final List<AuthorModel> authorsList = [];

    for (var author in authors) {
      authorsList.add(AuthorModel.fromJson(author));
    }

    return authorsList;
  }

  static _getStringList(List<dynamic> json) {
    final List<String> results = [];

    for (var item in json) {
      results.add(item);
    }

    return results;
  }
}

class AuthorModel extends AuthorEntity {
  AuthorModel({
    required super.name,
    required super.birthYear,
    required super.deathYear,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      name: json["name"] ?? "",
      birthYear: json["birth_year"] ?? 0,
      deathYear: json["death_year"] ?? 0,
    );
  }
}

class FormatsModel extends FormatsEntity {
  FormatsModel({
    required super.textHtmlCharsetIso88591,
    required super.textPlainCharsetUsAscii,
    required super.imageJpeg,
    required super.textPlain,
    required super.applicationRdfXml,
    required super.applicationEpubZip,
    required super.applicationXMobipocketEbook,
    required super.textHtml,
  });

  factory FormatsModel.fromJson(Map<String, dynamic> json) {
    return FormatsModel(
      textHtmlCharsetIso88591: json["text/html; charset=iso-8859-1"] ?? "",
      textPlainCharsetUsAscii: json["text/plain; charset=us-ascii"] ?? "",
      imageJpeg: json["image/jpeg"] ?? "",
      textPlain: json["text/plain"] ?? "",
      applicationRdfXml: json["application/rdf+xml"] ?? "",
      applicationEpubZip: json["application/epub+zip"] ?? "",
      applicationXMobipocketEbook: json["application/x-mobipocket-ebook"] ?? "",
      textHtml: json["text/html"] ?? "",
    );
  }
}
