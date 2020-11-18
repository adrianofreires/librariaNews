import 'dart:convert';

import 'package:libraria_news/data/providers/post_provider.dart';
import 'package:libraria_news/data/repository/post_repository.dart';
import 'package:libraria_news/modules/controller/wordpress_data.dart';
import 'package:http/http.dart' as http;

class Categories {
  Categories({
    this.name,
  });

  String name;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        name: json['name'] as String,
      );
}
//TODO: Tirar isso daqui
PostRepository repository =
      PostRepository(provider: PostProvider(httpClient: http.Client()));

// Future<dynamic> parsedCategories(String category) async {
//   WordPressData wordPressData = WordPressData();
//   final parsed = await repository.getAll;
//   return parsedData(parsed);
// }

List<Categories> parsedData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Categories>((json) => Categories.fromJson(json)).toList();
}
