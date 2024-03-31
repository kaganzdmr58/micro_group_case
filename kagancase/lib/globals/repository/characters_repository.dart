import 'package:kagancase/globals/helper/apicall_helper.dart';
import 'package:kagancase/globals/models/charaters/characters_model.dart';

class CharactersRepository {
  Future<List<CharactersModel>> getCharactersList({required String url}) async {
    final Map<String, dynamic> jsonMap =
        await ApiCallHelper.getApiCallWithUrl(url: url);

    List<dynamic> jsonData = jsonMap['data'];

    List<CharactersModel> dataCharacters =
        jsonData.map((val) => CharactersModel.fromJson(val)).toList();

    return dataCharacters;
  }
}
