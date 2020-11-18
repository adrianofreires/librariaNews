import 'package:flutter/material.dart';
import 'package:libraria_news/data/models/post.dart';
import 'package:libraria_news/modules/controller/home_controller.dart';
import 'components/post_list_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future<dynamic> futurePosts;

  HomeController controller = HomeController();

  @override
  void initState() {
    controller.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder<List<PostModel>>(
        future: controller.postList,
        builder: (context, snapshot) {
          if (!snapshot.hasError)
            return snapshot.hasData
                ? PostTile(
                    posts: snapshot.data,
                  )
                : Center(child: CircularProgressIndicator());
          return Text('Error');
        },
      ),
    );
  }
}
