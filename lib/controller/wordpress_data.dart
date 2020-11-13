import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:libraria_news/models/posts.dart';

String baseUrl = 'https://news.libraria.com.br/wp-json/wp/v2/';

class WordPressData {

  List<Posts> parsedData(String responseBody){
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Posts>((json) => Posts.fromJson(json)).toList();
  }

  Future getData(String selectedParameter) async {
    String requestUrl = baseUrl + selectedParameter;

    http.Response response = await http.get(requestUrl);

    if (response.statusCode == 200) {
      String data = response.body;
      return parsedData(data);
    } else {
      print(response.statusCode);
      throw 'Problema com a conexão';
    }
  }
}
