import 'package:flutter_test/flutter_test.dart';
import 'package:libraria_news/data/providers/post_provider.dart';
import 'package:http/http.dart' as http;

main() {
  PostProvider provider = PostProvider(httpClient: http.Client());
  test('Parsing json', () async {
    // var response = await provider.decodeJson();
    // expect(response, '');
  });
}
