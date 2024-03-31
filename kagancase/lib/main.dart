import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/anime/anime_list_page.dart';
import 'modules/anime/view_model/anime_page_viewmodel.dart';
import 'modules/anime_detail/view_model/anime_detail_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnimePageViewModel()),
        BlocProvider(create: (context) => AnimeDetailPageViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AnimeListPage(),
      ),
    );
  }
}
