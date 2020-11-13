import 'package:libraria_news/controller/wordpress_data.dart';

final String endpoint = 'posts?page=';
final int currentPage = 1;

class Posts {
  int id;
  String date, featuredMedia;
  String  title;

  Posts({this.id, this.date, this.featuredMedia, this.title});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      id: json['id'] as int,
      title: json['title']['rendered'] as String,
      date: json['date'] as String,
      featuredMedia: json['fimg_url'] as String,
    );
  }

  Future<dynamic> parsedPages() async{
    WordPressData wordPressData = WordPressData();
    final parsed = await wordPressData.getData(endpoint, currentPage);
    print(parsed);
    return parsed;
  }
}
