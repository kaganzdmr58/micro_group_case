package com.example.kagancase

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {

    private val  ANIME_CHANNEL= "com.example.casekagan/anime"
    private lateinit var channel: MethodChannel

    override fun configureFlutterEngine( flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,ANIME_CHANNEL)

        channel.setMethodCallHandler { call, result ->
            if (call.method.equals("fetchAnimeList")) {
                val page: Int? = call.argument("page");
                var  animeList : List<String>? = page?.let { createAnimeList(it) }
                result.success(animeList)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun createAnimeList(page : Int = 1): List<String> {

        val animeList: MutableList<String> = ArrayList()
        animeList.add("Anime 1$page")
        animeList.add("Anime 2")
        animeList.add("Anime 3")
        return animeList
    }
}
