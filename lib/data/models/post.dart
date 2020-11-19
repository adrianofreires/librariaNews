class PostModel {
  int id;
  String date;
  String featuredMedia;
  String title;
  String categoryUrl;

  PostModel({
    this.id,
    this.title,
    this.date,
    this.featuredMedia,
    this.categoryUrl,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'],
        title: json['title']['rendered'],
        date: json['date'],
        featuredMedia: json['_links']['wp:featuredmedia'][0]['href'],
        categoryUrl: json['_links']['wp:term'][0]['href']);
  }
}
