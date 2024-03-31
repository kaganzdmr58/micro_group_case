import 'dart:convert';

import 'package:kagancase/globals/utils/const.dart';
import 'package:kagancase/globals/utils/tools.dart';

class ApiCallHelper {
 static Future<Map<String, dynamic>> getApiCallWithUrl({required String url}) async {
    final jsonString = await animeChannel.invokeMethod(
      ConstVariables.methodChannelMethodName,
      {ConstVariables.methodChannelMethodVariablesKey: url},
    );
    return json.decode(jsonString);
  }
}
