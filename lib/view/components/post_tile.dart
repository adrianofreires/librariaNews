import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {

  String image, category, date, title;

  PostTile({this.image, this.date, this.category, this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(image),
      title: Row(
        children: <Widget>[
          Text(category),
          Text(date),
        ],
      ),
      subtitle: Text(title),
      onTap: (){},
    );
  }
}
