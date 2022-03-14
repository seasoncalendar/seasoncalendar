import 'dart:io';

import 'package:mutex/mutex.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/models/region.dart';
import 'package:sqflite/sqflite.dart';

import 'lang_helper.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static final Mutex _db_file_mutex = Mutex();
  static Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      await _db_file_mutex.acquire();
      try {
        _database ??= await initDB();
      } finally {
        _db_file_mutex.release();
      }
    }

    return _database!;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "foods.db");

    // always get a fresh asset copy
    await deleteDatabase(path);

    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(join("assets/db", "foods.db"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);

    // open and return the database
    var res = await openDatabase(path);
    return res;
  }

  Future<Iterable<Region>> getRegions() async {
    final Database db = await database;

    final List<Map<String, dynamic>> results = await db.rawQuery("""
        SELECT id, fallbackRegion, assetPath
        FROM regions 
        """, []);

    var res = results.map((item) => Region.fromMap(item)).toList();

    // set fallbackRegion from id
    for (var r in res) {
      if (r.fallbackRegionId == null) continue;
      r.fallbackRegion = res.firstWhere((e) => r.fallbackRegionId == e.id);
    }
    return res;
  }

  Future<List<Food>> getFoods(Region region) async {
    final Database db = await database;

    var allRegions = await getRegions();

    var fallbackRegion = region.fallbackRegion?.id ?? region.fallbackRegionId ?? "NULL";

    // get the foods
    final List<Map<String, dynamic>> results = await db.rawQuery("""
        SELECT f.id AS id, f.type AS type, f.assetImgPath AS assetImgPath, f.assetImgInfo AS assetImgInfo, f.assetImgSourceUrl as assetImgSourceUrl, 
               fr.region_id as region_id, fr.is_common as is_common, fr.avLocal as avLocal, fr.avLand as avLand, fr.avSea as avSea, fr.avAir as avAir
        FROM foods AS f
        INNER JOIN food_region_availability AS fr ON (f.id == fr.food_id)
        WHERE fr.region_id = ?
        
        UNION ALL
        
        SELECT f.id AS id, f.type AS type, f.assetImgPath AS assetImgPath, f.assetImgInfo AS assetImgInfo, f.assetImgSourceUrl as assetImgSourceUrl, 
               fr.region_id as region_id, fr.is_common as is_common, fr.avLocal as avLocal, fr.avLand as avLand, fr.avSea as avSea, fr.avAir as avAir
        FROM foods AS f
        INNER JOIN food_region_availability AS fr ON (f.id == fr.food_id)
        WHERE fr.region_id = ?
        AND f.id NOT IN (SELECT f.id
                         FROM foods AS f
                         INNER JOIN food_region_availability AS fr ON (f.id == fr.food_id)
                         WHERE fr.region_id = ?)
        
        UNION ALL
        
        SELECT f.id AS id, f.type AS type, f.assetImgPath AS assetImgPath, f.assetImgInfo AS assetImgInfo, f.assetImgSourceUrl as assetImgSourceUrl, 
               IFNULL(fr.region_id, ?) as region_id, fr.is_common as is_common, fr.avLocal as avLocal, fr.avLand as avLand, fr.avSea as avSea, fr.avAir as avAir
        FROM foods as f
        LEFT OUTER JOIN (SELECT * FROM food_region_availability WHERE region_id = ? OR region_id = ?)
          AS fr ON (f.id IS fr.food_id)
        WHERE fr.region_id is NULL

        """, [region.id, fallbackRegion, region.id, region.id, region.id, fallbackRegion]);

    return results.map((item) {
      String foodId = item['id'];
      String type = item['type'];
      String assetImgPath = item['assetImgPath'];
      String assetImgSourceUrl = item['assetImgSourceUrl'];
      String assetImgInfo = item['assetImgInfo'];

      Region region =
          allRegions.firstWhere((region) => region.id == item['region_id']);
      int isCommon = item['is_common'] ?? 1;
      String avLocal = item['avLocal'] ?? "-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1";
      String avLand = item['avLand'] ?? "-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1";
      String avSea = item['avSea'] ?? "-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1";
      String avAir = item['avAir'] ?? "-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1";

      String foodNamesString = getTranslationByKey(foodId + "_names");
      String infoUrl = getTranslationByKey(foodId + "_infoUrl");

      return Food(
          foodId,
          foodNamesString,
          type,
          isCommon,
          avLocal,
          avLand,
          avSea,
          avAir,
          infoUrl,
          assetImgPath,
          assetImgSourceUrl,
          assetImgInfo,
          region);
    }).toList();
  }
}
