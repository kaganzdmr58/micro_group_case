class AnimeGenresModel {
  final int malId;
  final String type;
  final String url;
  final String name;

  AnimeGenresModel({
    required this.malId,
    required this.type,
    required this.url,
    required this.name,
  });

  factory AnimeGenresModel.fromJson(Map<String, dynamic> json) {
    return AnimeGenresModel(
      malId: json['mal_id'],
      type: json['type'],
      url: json["url"],
      name: json['name'],
    );
  }
}