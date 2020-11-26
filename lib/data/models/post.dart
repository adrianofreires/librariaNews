class PostModel {
  int id;
  String date;
  String featuredMedia;
  String title;
  String categoryUrl;
  List categories = [];

  PostModel({this.id, this.title, this.date, this.featuredMedia, this.categoryUrl, this.categories});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title']['rendered'],
      date: json['date'],
      featuredMedia: json['fimg_url'],
      categoryUrl: json['_links']['wp:term'][0]['href'],
      categories: json['categories_names'],
    );
  }
}
