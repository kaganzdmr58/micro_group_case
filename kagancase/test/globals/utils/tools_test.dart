import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kagancase/globals/utils/tools.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  group('test utils tools group tests :', () {
    test('unittest getAnimationListUrl is passed', () async {
      final result = getAnimationListUrl(1);
      expect(result, 'https://api.jikan.moe/v4/top/anime?page=1&limit=20');
    });
    test('unittest getCharactersUrl is passed', () async {
      final result = getCharactersUrl(1290);
      expect(result, 'https://api.jikan.moe/v4/anime/1290/characters');
    });
  });
}
