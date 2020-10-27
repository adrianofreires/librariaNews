class Categories {

  String href;

  Categories({this.href});

  factory Categories.fromJson(Map<String, dynamic> json){
    return Categories(
        href : json['name'],
    );
  }

}