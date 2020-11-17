import 'dart:convert';
import 'package:libraria_news/controller/wordpress_data.dart';

class Categories {
  Categories({
    this.name,
  });

  String name;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        name: json['name'] as String,
      );
}

Future<dynamic> parsedCategories(String category) async {
  WordPressData wordPressData = WordPressData();
  final parsed = await wordPressData.getData(category);
  return parsedData(parsed);
}

List<Categories> parsedData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Categories>((json) => Categories.fromJson(json)).toList();
}
