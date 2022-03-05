import 'dart:core';

import 'package:seasoncalendar/helpers/lang_helper.dart';

const String tableRegions = 'regions';
const String columnId = 'id';
const String columnFallbackRegion = 'fallbackRegion';
const String columnAssetPath = 'assetPath';

class Region {
  final String id;
  final String? fallbackRegionId;
  Region? fallbackRegion;
  final String assetPath;
  get name {
    return getTranslationByKey(assetPath);
  }

  Region(this.id, this.fallbackRegionId, this.assetPath);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnId: id,
      columnFallbackRegion: fallbackRegion,
      columnAssetPath: assetPath,
    };
    return map;
  }

  Region.fromMap(Map<String, dynamic> map)
      : id = map[columnId],
        fallbackRegionId = map[columnFallbackRegion],
        assetPath = map[columnAssetPath];
}
