package com.example.kagancase
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val  ANIME_CHANNEL= "com.example.casekagan/anime"
    private lateinit var channel: MethodChannel
    private val defaultUrl = "https://api.jikan.moe/v4/top/anime?page=1&limit=20"

    override fun configureFlutterEngine( flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,ANIME_CHANNEL)

        channel.setMethodCallHandler { call, result ->
            if (call.method.equals("fetchAnimeList")) {
                val page: String? = call.argument("url");

                page?.let { makeApiCall(result, it) }
            } else {
                result.notImplemented()
            }
        }
    }


    private fun makeApiCall(result: MethodChannel.Result, url: String = defaultUrl) {

        val request = StringRequest(
            Request.Method.GET, url,
            Response.Listener<String> { response ->
                result.success(response)
            },
            Response.ErrorListener { error ->
                result.error("NETWORK_ERROR", error.message, null)
            })

        Volley.newRequestQueue(context).add(request)
    }


}