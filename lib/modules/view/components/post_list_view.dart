import 'package:flutter/material.dart';
import 'package:libraria_news/modules/controller/home_controller.dart';
import 'package:libraria_news/modules/view/components/post_card.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  HomeController controller = HomeController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    controller.onInit();
    _scrollController.addListener(() {
      var triggerScrollController = 0.85 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels >= triggerScrollController) {
        setState(() {
          controller.postList = controller.nextPage();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.postList,
        builder: (context, snapshot) {
          if (!snapshot.hasError)
            return snapshot.hasData
                ? ListView.builder(
                    controller: _scrollController,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return PostCard(
                        post: snapshot.data[index],
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          return Text('Error');
        });
  }
}
