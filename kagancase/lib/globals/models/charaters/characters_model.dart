class CharactersModel {
  final int malId;
  final String imagesUrl;
  final String name;

  CharactersModel({
    required this.malId,
    required this.imagesUrl,
    required this.name,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      malId: json["character"]['mal_id'],
      imagesUrl: json["character"]['images']["jpg"]["image_url"],
      name: json["character"]['name'],
    );
  }
}