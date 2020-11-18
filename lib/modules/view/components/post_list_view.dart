import 'package:flutter/material.dart';
import 'package:libraria_news/data/models/categories.dart';
import 'package:libraria_news/data/models/post.dart';
import 'package:libraria_news/modules/view/components/post_card.dart';

class PostTile extends StatelessWidget {
  final List<PostModel> posts;
  final List<Categories> categories;

  PostTile({Key key, this.posts, this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostCard(post: posts[index]);
      },
    );
  }
}