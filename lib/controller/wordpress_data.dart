import 'package:http/http.dart' as http;
import 'dart:convert';


String baseUrl = 'https://news.libraria.com.br/wp-json/wp/v2/';

class WordPressData {


  Future getData(String selectedParameter, [int page]) async {

    String requestUrl = baseUrl + selectedParameter + page.toString();

    http.Response response = await http.get(requestUrl);

    if(response.statusCode == 200){
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      throw 'Problema com a conexão';
    }
  }
}