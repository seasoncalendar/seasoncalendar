final String tableRegions = 'regions';
final String columnId = 'id';
final String columnFallbackRegion = 'fallbackRegion';
final String columnAssetPath = 'assetPath';

class Region {
  late String id;
  late String? fallbackRegion;
  late String assetPath;
  late String name;

  Region();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnFallbackRegion: fallbackRegion,
      columnAssetPath: assetPath,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Region.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    fallbackRegion = map[columnFallbackRegion];
    assetPath = map[columnAssetPath];
  }
}
