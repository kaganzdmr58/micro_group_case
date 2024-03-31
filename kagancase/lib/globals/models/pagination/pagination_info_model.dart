import 'anime_items_info_model.dart';

class PaginationInfoModel {
  int? lastVisiblePage;
  bool hasNextPage;
  int currentPage;
  AnimeItemsInfo? itemsInfo;

  PaginationInfoModel({
    this.lastVisiblePage,
    this.hasNextPage = true,
    this.currentPage = 1,
    this.itemsInfo,
  });

  factory PaginationInfoModel.fromJson(Map<String, dynamic> json) {
    return PaginationInfoModel(
      lastVisiblePage: json['last_visible_page'],
      hasNextPage: json['has_next_page'],
      currentPage: json['current_page'],
      itemsInfo: AnimeItemsInfo.fromJson(json['items']),
    );
  }
}
