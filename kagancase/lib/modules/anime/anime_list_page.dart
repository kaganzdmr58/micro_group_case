import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kagancase/globals/models/anime/anime_model.dart';
import 'package:kagancase/modules/anime/view_model/anime_page_viewmodel.dart';
import 'package:kagancase/modules/anime_detail/anime_detail_page.dart';

class AnimeListPage extends StatefulWidget {
  const AnimeListPage({super.key});

  @override
  State<AnimeListPage> createState() => _AnimeListPageState();
}

class _AnimeListPageState extends State<AnimeListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<AnimePageViewModel>().nextPage();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Anime List Page",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => const [
              PopupMenuItem(value: 1, child: Text('All')),
              PopupMenuItem(value: 2, child: Text('Movie')),
              PopupMenuItem(value: 3, child: Text('TV')),
            ],
            onSelected: (value) {
              switch (value) {
                case 1:
                  context.read<AnimePageViewModel>().getCurrentAnimeList();
                  break;
                case 2:
                  context
                      .read<AnimePageViewModel>()
                      .getSearchAnimeList("Movie");
                  break;
                case 3:
                  context
                      .read<AnimePageViewModel>()
                      .getSearchAnimeList("TV");
                  break;
                
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<AnimePageViewModel, List<AnimeItemModel>>(
        builder: (context, snapshot) {
          if (snapshot.isNotEmpty) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: snapshot.length,
              itemBuilder: (context, index) {
                AnimeItemModel animeItem = snapshot[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AnimeDetailPage(model: animeItem),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Image.network(
                          animeItem.images.jpg.small_image_url ?? ""),
                      title: Text(
                        animeItem.title,
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Rating: ${animeItem.rating.toString()}'),
                          Text('Score: ${animeItem.score.toString()}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context.read<AnimePageViewModel>().nextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
