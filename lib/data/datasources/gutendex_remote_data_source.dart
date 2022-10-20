import 'dart:convert';
import "package:http/http.dart" as http;

import '../models/booklist_model.dart';
import '../../core/error/exceptions.dart';

abstract class GutendexRemoteDataSource {
  Future<BookListModel> getBooksByQuery(String query);
}

class GutendexRemoteDataSourceImplementation extends GutendexRemoteDataSource {
  final http.Client client;

  GutendexRemoteDataSourceImplementation({
    required this.client,
  });

  @override
  Future<BookListModel> getBooksByQuery(String query) async {
    final uri = Uri.parse(query);

    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await client.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return BookListModel.fromJson(jsonResponse);
    } else {
      throw ServerException();
    }
  }
}
