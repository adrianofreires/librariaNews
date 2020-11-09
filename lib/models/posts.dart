import 'package:libraria_news/controller/wordpress_data.dart';
import 'package:libraria_news/models/categories.dart';

final String endpoint = '?page=';
final int currentPage = 1;

class Posts {
  int id;
  String date, featuredMedia;
  String link, title;
  int author;
  Categories categories;

  Posts(
      {this.id,
      this.date,
      this.link,
      this.author,
      this.featuredMedia,
      this.categories,
      this.title});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      id: json['id'],
      title: json['title']['rendered'],
      date: json['date'],
      link: json['link'],
      author: json['author'],
      featuredMedia: json['fimg_url'],
    );
  }

  Future<dynamic> parsedPages() async{
    WordPressData wordPressData = WordPressData();
    final parsed = await wordPressData.getData('posts?page=', currentPage);
    return Posts.fromJson(parsed);
  }
}
