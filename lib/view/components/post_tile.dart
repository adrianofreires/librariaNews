import 'package:flutter/material.dart';
import 'package:libraria_news/models/posts.dart';

class PostTile extends StatelessWidget {

  final List<Posts> posts;

  PostTile({Key key, this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        return Card(
          child: Column(
            children: [
              Image.network(posts[index].featuredMedia),
              Row(
                children: [
                  Text(posts[index].date),
                ],
              ),
              Text(posts[index].title),
            ],
          ),
        );
      },
    );
  }
}
