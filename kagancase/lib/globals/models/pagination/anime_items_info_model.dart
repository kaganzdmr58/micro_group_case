class AnimeItemsInfo {
  final int count;
  final int total;
  final int perPage;

  AnimeItemsInfo({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory AnimeItemsInfo.fromJson(Map<String, dynamic> json) {
    return AnimeItemsInfo(
      count: json['count'],
      total: json['total'],
      perPage: json['per_page'],
    );
  }
}
