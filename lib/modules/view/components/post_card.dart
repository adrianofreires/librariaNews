import 'package:flutter/material.dart';
import 'package:libraria_news/data/models/post.dart';
import 'package:libraria_news/modules/controller/home_controller.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  final HomeController controller = HomeController();

  PostCard({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(post.categoryUrl);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 9.0, horizontal: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: Colors.black,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0)),
              child: Image.network(post.featuredMedia)),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    FutureBuilder<String>(
                      future: controller.fetchCategory(post),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return Text('Carregando categoria');
                        return Text(
                          snapshot.data,
                          style: TextStyle(
                            
                            color: Theme.of(context).accentColor,
                          ),
                        );
                      },
                    ),
                    Text(
                      post.date,
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
                  post.title,
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
  }
}
