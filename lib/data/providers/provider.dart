import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:libraria_news/data/models/post.dart';
import 'package:meta/meta.dart';

final String _baseUrl = 'https://news.libraria.com.br/wp-json/wp/v2/posts?page=';
final int _currentPage = 1;

class Provider {
  final http.Client httpClient;
  Provider({@required this.httpClient});

  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> postList = [];
    try {
      var response = await http.get(_baseUrl + _currentPage.toString());
      List jsonResponse = json.decode(response.body);
      jsonResponse.forEach((json) {
        postList.add(PostModel.fromJson(json));
      });
    } catch (e) {
      print('Algo deu errado: Post Provider');
      return null;
    }

    return postList;
  }

  Future<String> getCategory(PostModel post) async {
    final url = post.categoryUrl;
    var response = await http.get(url);
    List jsonResponse = jsonDecode(response.body);
    Map categoryResponse = jsonResponse[0];
    String categoryName = categoryResponse['name'];
    print(categoryName);
    return categoryName;
  }

  Future<String> getMedia(PostModel post) async {
    final url = post.featuredMedia;
    var response = await http.get(url);
    Map jsonResponse = jsonDecode(response.body);
    String mediaUrl = jsonResponse['source_url'];
    print(mediaUrl);
    return mediaUrl;
  }
}
