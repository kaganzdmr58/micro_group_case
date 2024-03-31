import 'anime_image_size_model.dart';

class AnimeImagesModel {
  final AnimeImageSizeModel jpg;
  final AnimeImageSizeModel? webp;

  AnimeImagesModel({
    required this.jpg,
    this.webp,
  });

  factory AnimeImagesModel.fromJson(Map<String, dynamic> json) {
    return AnimeImagesModel(
      jpg: AnimeImageSizeModel.fromJson(json['jpg']),
      webp: AnimeImageSizeModel.fromJson(json['webp']),
    );
  }
}
