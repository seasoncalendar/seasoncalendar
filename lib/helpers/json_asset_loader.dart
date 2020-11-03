import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future<Map<String, dynamic>> loadAssetFromJson(String assetPath) async{

  var jsonResult;
  try {
    jsonResult = await rootBundle.loadString(assetPath);
    print("fdsgdlfgkjfdl");
  }
  catch(err) {
    print("KVLSKJDLF");
    print(err);
    return null;
  }
  var parsedJsonResult = json.decode(jsonResult);
  print("584962933");
  return parsedJsonResult;
}