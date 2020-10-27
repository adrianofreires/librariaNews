import 'package:libraria_news/models/categories.dart';
import 'package:libraria_news/models/featuredMedia.dart';

final String endpoint = '?page=';
final int currentPage = 1;

class Posts {
  int id;
  String date;
  String link, title;
  int author;
  FeaturedMedia featuredMedia;
  Categories categories;

  Posts(
      {this.id,
      this.date,
      this.link,
      this.author,
      this.featuredMedia,
      this.categories,
      this.title});

  factory Posts.fromJason(Map<String, dynamic> json) {
    return Posts(
      id: json['id'],
      title: json['title']['rendered'],
      date: json['date'],
      link: json['link'],
      author: json['author'],
      featuredMedia: json['_links']['wp:featuredmedia'][0]['href'] != null
          ? FeaturedMedia.fromJson(
              json['_links']['wp:featuredmedia'][0]['href'])
          : null,
      categories: json['_links']['wp:term'][0]['href'] != null
          ? Categories.fromJson(json['_links']['wp:term'][0]['href'])
          : null,
    );
  }
}
