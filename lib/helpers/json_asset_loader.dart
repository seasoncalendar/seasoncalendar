import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future<Map<String, dynamic>> loadAssetFromJson(String assetPath) async {
  return rootBundle
      .loadString(assetPath)
      .then((String content) => json.decode(content));
}
