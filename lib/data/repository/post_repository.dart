import 'package:libraria_news/data/models/post.dart';
import 'package:libraria_news/data/providers/post_provider.dart';
import 'package:meta/meta.dart';

class PostRepository {
  final PostProvider provider;

  PostRepository({@required this.provider}) : assert(provider != null);

  Future<List<PostModel>> getAllPosts() => provider.getAllPosts();

  getId(id) => provider.getId(id);

  delete(id) => provider.delete(id);

  edit(obj) => provider.edit(obj);

  add(obj) => provider.add(obj);
}

