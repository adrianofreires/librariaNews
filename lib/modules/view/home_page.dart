import 'package:flutter/material.dart';
import 'package:libraria_news/data/models/post.dart';
import 'components/post_list_view.dart';

class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {

  Future<dynamic> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = PostModel().parsedPages();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder<dynamic>(
        future: futurePosts,
        builder: (context, snapshot){
          if(!snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? PostTile(posts: snapshot.data,)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
