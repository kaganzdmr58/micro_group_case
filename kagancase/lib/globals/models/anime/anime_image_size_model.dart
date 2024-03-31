class AnimeImageSizeModel {
  final String image_url;
  final String small_image_url;
  final String large_image_url;

  AnimeImageSizeModel({
    required this.image_url,
    required this.large_image_url,
    required this.small_image_url,
  });

  factory AnimeImageSizeModel.fromJson(Map<String, dynamic> json) {
    return AnimeImageSizeModel(
      image_url: json['image_url'],
      small_image_url: json['small_image_url'],
      large_image_url: json['large_image_url'],
    );
  }
}
