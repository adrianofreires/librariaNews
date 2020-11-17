import 'package:libraria_news/controller/wordpress_data.dart';
import 'dart:convert';
import 'package:libraria_news/models/categories.dart';

final String endpoint = 'https://news.libraria.com.br/wp-json/wp/v2/posts?page=';
final int currentPage = 3;

class Posts {
  int id;
  String date, featuredMedia;
  String title;
  dynamic categories;

  Posts({this.id, this.date, this.featuredMedia, this.title, this.categories});

  factory Posts.fromJson(Map<String, dynamic> json) {
    print(json['_links']['wp:term'][0]['href']);
    return Posts(
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

  List<Posts> parsedData(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return (parsed.map<Posts>((json) => Posts.fromJson(json)).toList());
  }
}
