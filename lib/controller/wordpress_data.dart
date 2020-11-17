import 'package:http/http.dart' as http;

class WordPressData {
  Future getData(String selectedParameter) async {
    http.Response response = await http.get(selectedParameter);

    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      print(response.statusCode);
      throw 'Problema com a conexão';
    }
  }
}
