import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kagancase/globals/models/anime/anime_model.dart';
import 'package:kagancase/globals/models/charaters/characters_model.dart';
import 'package:kagancase/globals/utils/tools.dart';
import 'package:kagancase/modules/anime_detail/view_model/anime_detail_view_model.dart';

class AnimeDetailPage extends StatefulWidget {
  final AnimeItemModel model;
  const AnimeDetailPage({super.key, required this.model});

  @override
  State<AnimeDetailPage> createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<AnimeDetailPageViewModel>()
        .getCharactersList(id: widget.model.malId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(widget.model.images.jpg.image_url),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.model.title,
                  style: const TextStyle(fontSize: 36, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(widget.model.rating),
              ),
              if (widget.model.score != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(widget.model.score.toString()),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Wrap(
                  children: widget.model.genres.map((val) {
                    return Card(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          val?.name ?? "",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(widget.model.synopsis),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(widget.model.episodes.toString()),
              ),
              BlocBuilder<AnimeDetailPageViewModel, List<CharactersModel>>(
                  builder: (context, snapshot) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: snapshot.map((character) {
                      return SizedBox(
                        width: getScreenWidth(context) / 5 * 2,
                        height: (getScreenWidth(context) / 5 * 2) * 16 / 9,
                        child: Card(
                          child: Column(
                            children: [
                              Expanded(
                                  child: Image.network(
                                character.imagesUrl,
                                fit: BoxFit.fill,
                              )),
                              Text(character.name),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}