import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:libraria_news/data/models/post.dart';
import 'package:meta/meta.dart';

final String _baseUrl =
    'https://news.libraria.com.br/wp-json/wp/v2/posts?page=3'; // TODO: Remover o numero da pagina da url principal
final int _currentPage = 3;

class PostProvider {
  final http.Client httpClient;
  PostProvider({@required this.httpClient});

// http.Response response = await http.get(selectedParameter);

//     if (response.statusCode == 200) {
//       String data = response.body;
//       return data;
//     } else {
//       throw 'Problema com a conexão';
//     }

  Future<List<PostModel>> getAllPosts() async {
    var response = await http.get(_baseUrl);
    List jsonResponse = json.decode(response.body);
    List<PostModel> postList = [];
    jsonResponse.forEach((json) {
      postList.add(PostModel.fromJson(json));
    });

    return postList;
  }

  // Future<List<PostModel>> getAll() async {
  //   try {
  //     var response = await http.get(_baseUrl);
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> jsonResponse = json.decode(response.body);
  //       List<PostModel> listMyModel = jsonResponse['data'].map<PostModel>(
  //         (map) {
  //           return PostModel.fromJson(map);
  //         },
  //       ).toList();
  //       return listMyModel;
  //     } else
  //       return null;
  //   } catch (_) {
  //     return null;
  //   }
  // }

  getId(id) async {
    try {
      var response = await httpClient.get(_baseUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
      } 
    } catch (_) {}
  }

  add(obj) async {
    try {
      var response = await httpClient.post(_baseUrl,
          headers: {'Content-Type': 'application/json'}, body: jsonEncode(obj));
      if (response.statusCode == 200) {
        // TODO: implement methods!
      } 
    } catch (_) {}
  }

  edit(obj) async {
    try {
      var response = await httpClient.put(_baseUrl,
          headers: {'Content-Type': 'application/json'}, body: jsonEncode(obj));
      if (response.statusCode == 200) {
        // TODO: implement methods!
      } 
    } catch (_) {}
  }

  delete(obj) async {
    try {
      var response = await httpClient.delete(_baseUrl);
      if (response.statusCode == 200) {
        // TODO: implement methods!
      } 
    } catch (_) {}
  }
}
