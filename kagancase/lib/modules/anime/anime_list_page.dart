import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimeListPage extends StatefulWidget {
  const AnimeListPage({super.key});

  @override
  State<AnimeListPage> createState() => _AnimeListPageState();
}

class _AnimeListPageState extends State<AnimeListPage> {
  static const animeChannel = MethodChannel("com.example.casekagan/anime");
  var data = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data,
                style: const TextStyle(fontSize: 20, color: Colors.amber),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  fetchAnimeListFromNative(page: 1);
                },
                child: const Text("Fetch List"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  fetchAnimeListFromNative(page: 2);
                },
                child: const Text("Fetch List first"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getAnimeList() async {
    final int val = await animeChannel.invokeMethod("fetchAnimeList");

    print("animeFetchList : $val ");
    setState(() {
      data = "$val";
    });
  }

  Future<List<String>> fetchAnimeListFromNative({int page = 1}) async {
    try {
      final List<dynamic> response =
          await animeChannel.invokeMethod('fetchAnimeList', {'page': page});
      final List<String> animeList = response.cast<String>();

      setState(() {
        data = "${response.first}";
      });
      return animeList;
    } on PlatformException catch (e) {
      print("Failed to fetch anime list: '${e.message}'.");
      return [];
    }
  }
}
