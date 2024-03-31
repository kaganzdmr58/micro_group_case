import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kagancase/globals/utils/const.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

String getAnimationListUrl(int page) {
  return "${ConstVariables.baseUrl}${ConstVariables.topAnime}$page${ConstVariables.limit}${ConstVariables.listItemCount}";
}

String getCharactersUrl(int id) {
  return "${ConstVariables.baseUrl}${ConstVariables.anime}$id${ConstVariables.characters}";
}

const animeChannel = MethodChannel(ConstVariables.methodChannelName);
