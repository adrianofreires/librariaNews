import 'package:libraria_news/data/models/post.dart';
import 'package:libraria_news/data/providers/provider.dart';
import 'package:libraria_news/data/repository/repository.dart';
import 'package:http/http.dart' as http;

class HomeController {
  PostRepository repository =
      PostRepository(provider: Provider(httpClient: http.Client()));

  Future<List<PostModel>> postList;

  onInit() {
    postList = _fetchFuturePostList();
  }

  Future<List<PostModel>> _fetchFuturePostList() {
    return repository.getAllPosts();
  }

  Future<String> fetchCategory(post) {
    return repository.getCategory(post);
  }
}
