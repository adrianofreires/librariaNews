import 'dart:convert';

import 'package:libraria_news/data/models/categories.dart';
import 'package:libraria_news/modules/controller/wordpress_data.dart';

final String endpoint = 'https://news.libraria.com.br/wp-json/wp/v2/posts?page=';
final int currentPage = 3;

class PostModel {
  int id;
  String date, featuredMedia;
  String title;
  dynamic categories;

  PostModel({this.id, this.date, this.featuredMedia, this.title, this.categories});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    print(json['_links']['wp:term'][0]['href']);
    return PostModel(
      id: json['id'] as int,
      title: json['title']['rendered'] as String,
      date: json['date'] as String,
      featuredMedia: json['fimg_url'] as String,
      categories: parsedCategories(json['_links']['wp:term'][0]['href']),
    );
  }

  Future<dynamic> parsedPages() async {
    WordPressData wordPressData = WordPressData();
    final baseUrl = endpoint + currentPage.toString();
    final parsed = await wordPressData.getData(baseUrl);
    return parsedData(parsed);
  }

  List<PostModel> parsedData(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return (parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList());
  }
}
