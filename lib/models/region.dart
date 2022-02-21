const String tableRegions = 'regions';
const String columnId = 'id';
const String columnFallbackRegion = 'fallbackRegion';
const String columnAssetPath = 'assetPath';

class Region {
  late String id;
  String? fallbackRegionId;
  Region? fallbackRegion;
  late String assetPath;
  late String name;

  Region();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnId: id,
      columnFallbackRegion: fallbackRegion,
      columnAssetPath: assetPath,
    };
    return map;
  }

  Region.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    fallbackRegion = map[columnFallbackRegion];
    assetPath = map[columnAssetPath];
  }
}
