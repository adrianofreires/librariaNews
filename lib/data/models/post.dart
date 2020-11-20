class PostModel {
  int id;
  String date;
  String featuredMedia;
  String title;
  String categoryUrl;
  List categories = [];

  PostModel({this.id, this.title, this.date, this.featuredMedia, this.categoryUrl, this.categories});

  PostModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title']['rendered'];
    this.date = json['date'];
    this.featuredMedia = json['fimg_url'];
    this.categoryUrl = json['_links']['wp:term'][0]['href'];
    this.categories = json['categories_names'];
  }
}
