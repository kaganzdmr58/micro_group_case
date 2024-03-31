import 'package:kagancase/globals/models/anime/anime_images_model.dart';

import 'anime_genres_model.dart';

class AnimeItemModel {
  final int malId;
  final String url;
  final AnimeImagesModel images;
  final String title;
  final String rating;
  final String type;
  final List<AnimeGenresModel?> genres;
  final String synopsis;
  final int? episodes;
  final double? score;

  AnimeItemModel({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
    required this.rating,
    required this.type,
    required this.genres,
    required this.synopsis,
    this.episodes,
    this.score,
  });

  factory AnimeItemModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonGenres = json['genres'];
    List<AnimeGenresModel?> genres =
        jsonGenres.map((genre) => AnimeGenresModel.fromJson(genre)).toList();

    return AnimeItemModel(
      malId: json['mal_id'],
      url: json['url'],
      images: AnimeImagesModel.fromJson(json['images']),
      title: json['title'],
      rating: json['rating'],
      type: json['type'],
      genres: genres,
      synopsis: json['synopsis'],
      episodes: json['episodes'] != null ? json["episodes"] : 0,
      score: json['score'] != null ? json["score"] : 0.0,
    );
  }
}
