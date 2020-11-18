import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:libraria_news/data/models/categories.dart';
import 'package:libraria_news/data/providers/post_provider.dart';
import 'package:libraria_news/data/repository/post_repository.dart';
import 'package:libraria_news/modules/controller/wordpress_data.dart';

// final String _baseUrl =
//     'https://news.libraria.com.br/wp-json/wp/v2/posts?page=';
// final int currentPage = 3;

// class PModel {
//   int id;
//   String date, featuredMedia;
//   String title;
//   dynamic categories;

//   PModel({this.id, this.date, this.featuredMedia, this.title, this.categories});

//   factory PModel.fromJson(Map<String, dynamic> json) {
//     return PModel(
//       id: json['id'] as int,
//       title: json['title']['rendered'] as String,
//       date: json['date'] as String,
//       featuredMedia: json['fimg_url'] as String,
//       // categories: parsedCategories(json['_links']['wp:term'][0]['href']),
//     );
//   }

// //TODO: Tirar isso daqui
//   PostRepository repository =
//       PostRepository(provider: PostProvider(httpClient: http.Client()));

//   Future<dynamic> parsedPages() async {
//     WordPressData wordPressData = WordPressData();
//     final baseUrl = _baseUrl + currentPage.toString();
//     final parsed = await repository.getAll();
//     // return parsedData(parsed);
//   }

//   List<PModel> parsedData(String responseBody) {
//     final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//     return (parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList());
//   }
// }

// categories: parsedCategories(json['_links']['wp:term'][0]['href']),

class PostModel {
  int id;
  String date;
  String featuredMedia;
  String title;
  // final dynamic categories;

  PostModel({
    this.id,
    this.title,
    this.date,
    this.featuredMedia,
    // this.categories,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title']['rendered'];
    this.date = json['date'];
    this.featuredMedia = json['fimg_url'];
  }
}
