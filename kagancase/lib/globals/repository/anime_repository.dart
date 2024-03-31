import 'package:kagancase/globals/helper/apicall_helper.dart';
import 'package:kagancase/globals/models/anime/anime_model.dart';
import 'package:kagancase/globals/models/pagination/pagination_info_model.dart';
import 'package:kagancase/globals/models/pagination/pagination_model.dart';
import 'package:kagancase/globals/utils/tools.dart';

class AnimeRepository {
  final _animeList = <AnimeItemModel>[];
  var _paginationModel = PaginationModel(
    data: <AnimeItemModel>[],
    paginationInfoModel: PaginationInfoModel(),
  );

  Future<List<AnimeItemModel>> getAnimeAllAnimeList() async {
    return _animeList;
  }

  Future<PaginationModel> getPaginationModel() async {
    return _paginationModel;
  }

  void setPaginationModel(PaginationModel paginationModel) {
    _paginationModel = paginationModel;
  }

  Future<void> updatePaginationModel(PaginationModel paginationModel) async {
    _animeList.addAll(paginationModel.data);
    _paginationModel.paginationInfoModel = paginationModel.paginationInfoModel;
  }

  Future<void> nexPage() async {
    final pageCount = _paginationModel.paginationInfoModel.currentPage;
    var model = await getAnimeList(
      url: getAnimationListUrl(pageCount + 1),
    );
    await updatePaginationModel(model);
  }

  Future<PaginationModel> getAnimeList({required String url}) async {
    final Map<String, dynamic> jsonMap =
        await ApiCallHelper.getApiCallWithUrl(url: url);
    return PaginationModel.fromJson(jsonMap);
  }
}
