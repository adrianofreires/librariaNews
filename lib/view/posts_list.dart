import 'package:flutter/material.dart';
import 'components/post_tile.dart';
import 'package:libraria_news/models/posts.dart';

class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {

  Future<dynamic> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = Posts().parsedPages();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: futurePosts,
      builder: (context, snapshot){
        if(!snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? PostTile(posts: snapshot.data,)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
