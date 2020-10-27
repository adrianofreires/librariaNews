import 'package:flutter/material.dart';
import 'package:libraria_news/controller/wordpress_data.dart';
import 'components/post_tile.dart';
import 'package:libraria_news/models/posts.dart';

class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

int page = 1;
List<Posts> parsedPages(){
  final parsed = WordPressData().getData('?page=$page') as List<dynamic>;
  return parsed.map<Posts>((json) => Posts.fromJason(json)).toList();
}

class _PostsListState extends State<PostsList> {
  List<Posts> posts = [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => PostTile(
          image: posts[index].featuredMedia,
          category: posts[index].categories,
          date: posts[index].date,
          title: posts[index].title,
        )
    );
  }
}
