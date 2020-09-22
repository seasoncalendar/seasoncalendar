import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future<Map<String, dynamic>> loadAssetFromJson(String assetPath) async{

  var jsonResult;
  try {
    jsonResult = await rootBundle.loadString(assetPath);
  }
  catch(err) {
    print(err);
    return null;
  }
  var parsedJsonResult = json.decode(jsonResult);
  return parsedJsonResult;
}