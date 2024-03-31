import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kagancase/globals/models/charaters/characters_model.dart';
import 'package:kagancase/globals/repository/characters_repository.dart';
import 'package:kagancase/globals/utils/tools.dart';

class AnimeDetailPageViewModel extends Cubit<List<CharactersModel>> {
  AnimeDetailPageViewModel() : super(<CharactersModel>[]);

  final repo = CharactersRepository();

  Future<void> getCharactersList({required int id}) async {

    var list = await repo.getCharactersList(url: getCharactersUrl(id));
    emit([...list]);
  }
}
