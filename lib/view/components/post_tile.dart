import 'package:flutter/material.dart';
import 'package:libraria_news/models/posts.dart';

class PostTile extends StatelessWidget {
  final List<Posts> posts;

  PostTile({Key key, this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 9.0, horizontal: 8.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: Colors.black,
          child: Column(
            children: [
              Image.network(posts[index].featuredMedia),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          posts[index].date,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      posts[index].title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 13.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
