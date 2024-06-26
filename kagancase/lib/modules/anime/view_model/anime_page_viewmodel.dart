import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kagancase/globals/models/anime/anime_model.dart';
import 'package:kagancase/globals/repository/anime_repository.dart';

class AnimePageViewModel extends Cubit<List<AnimeItemModel>> {
  AnimePageViewModel() : super(<AnimeItemModel>[]);

  final repo = AnimeRepository();

  Future<void> getAnimeList() async {
    var list = await repo.getAnimeAllAnimeList();
    emit([...list]);
  }

  Future<void> getCurrentAnimeList() async {
    var list = await repo.getAnimeAllAnimeList();
    emit(list);
  }

  Future<void> nextPage() async {
    await repo.nexPage();
    getAnimeList();
  }

  Future<void> getSearchAnimeList(String search) async {
    var list = await repo.getAnimeAllAnimeList();
    var newList = <AnimeItemModel>[];
    for (AnimeItemModel a in list) {
      if (a.type.toLowerCase() == search.toLowerCase()) {
        newList.add(a);
      }
    }
    emit(newList);
  }
}
