import 'package:kagancase/globals/models/anime/anime_model.dart';
import 'package:kagancase/globals/models/pagination/pagination_info_model.dart';

class PaginationModel {
  PaginationInfoModel paginationInfoModel;
  List<AnimeItemModel> data;

  PaginationModel({
    required this.paginationInfoModel,
    required this.data,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      paginationInfoModel: PaginationInfoModel.fromJson(json['pagination']),
      data: (json['data'] as List)
          .map((item) => AnimeItemModel.fromJson(item))
          .toList(),
    );
  }
}
