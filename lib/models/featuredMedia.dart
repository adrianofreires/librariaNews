class FeaturedMedia {

  String href;

  FeaturedMedia({ this.href});

  factory FeaturedMedia.fromJson(Map<String, dynamic> json) {
    return FeaturedMedia(
      href : json['href'],
    );
  }

}