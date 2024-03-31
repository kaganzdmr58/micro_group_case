import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kagancase/globals/models/anime/anime_image_size_model.dart';
import 'package:kagancase/globals/models/anime/anime_images_model.dart';
import 'package:kagancase/globals/models/anime/anime_model.dart';
import 'package:kagancase/modules/anime_detail/anime_detail_page.dart';
import 'package:kagancase/modules/anime_detail/view_model/anime_detail_view_model.dart';

var anime = AnimeItemModel(
  title: 'Anime 123',
  rating: "4.5",
  score: 8.7,
  genres: [],
  images: AnimeImagesModel(
    jpg: AnimeImageSizeModel(),
  ),
  malId: 28957,
  synopsis: '',
  url: '',
  type: '',
);

void main() {
  testWidgets('Find first text on AnimeDetailPage',
      (WidgetTester tester) async {
    final widget = MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnimeDetailPageViewModel()),
      ],
      child: MaterialApp(
        home: AnimeDetailPage(model: anime),
      ),
    );

    await tester.pumpWidget(widget);

    expect(find.text('Anime 123'), findsWidgets);
  });
}
