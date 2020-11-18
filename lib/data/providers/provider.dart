import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:libraria_news/data/models/post.dart';
import 'package:meta/meta.dart';

final String _baseUrl =
    'https://news.libraria.com.br/wp-json/wp/v2/posts?page=3'; // TODO: Remover o numero da pagina da url principal
final int _currentPage = 3;

class Provider {
  final http.Client httpClient;
  Provider({@required this.httpClient});

  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> postList = [];
    try {
      var response = await http.get(_baseUrl);
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
    Map categoryResposne = jsonResponse[0];
    String categoryName = categoryResposne['name'];
    return categoryName;
  }
}
