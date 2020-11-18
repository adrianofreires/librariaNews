import 'package:libraria_news/data/models/post.dart';
import 'package:libraria_news/data/providers/post_provider.dart';
import 'package:libraria_news/data/repository/post_repository.dart';
import 'package:http/http.dart' as http;

class HomeController {
  PostRepository repository =
      PostRepository(provider: PostProvider(httpClient: http.Client()));

  List<PostModel> postList = [];

  Future<List<PostModel>> futurePostList;

  onInit() {
    // postList = fetchPostList();
    futurePostList = getFuturePostList();
  }

  Future<List<PostModel>> getFuturePostList() {
    return repository.getAllPosts();
  }

  fetchPostList() async {
    return await repository.getAllPosts();
  }
}
