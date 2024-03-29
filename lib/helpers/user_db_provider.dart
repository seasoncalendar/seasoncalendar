
import 'dart:developer';

import 'package:seasoncalendar/models/availability.dart';
import 'package:seasoncalendar/models/region.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:collection/collection.dart';
import 'dart:io';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/helpers/db_provider.dart';

class UserDBProvider {
  UserDBProvider._();

  static final UserDBProvider db = UserDBProvider._();
  static Database? _userdatabase;

  Future<Database> get userdatabase async {
    _userdatabase ??= await initDB();
    return _userdatabase!;
  }

  _onOpen(Database db) async {
    // Database is open, print its version
    log('user db version ${await db.getVersion()}');
  }

  _onCreate(Database db, int version) async {
    // Database is created, create the table
    await db.execute(
        "CREATE TABLE food_region_availability (food_id	TEXT NOT NULL, region_id TEXT NOT NULL, avLocal	TEXT, avLand	TEXT, avSea	TEXT, avAir	TEXT, PRIMARY KEY(food_id, region_id))");
    log('created user db');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Database version is updated, alter the table
    log('Upgrade user db from $oldVersion to $newVersion');
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "custom_foods.db");
    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    var db = await openDatabase(
      path,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onDowngrade: onDatabaseDowngradeDelete,
      version: 1,
      onOpen: _onOpen,
    );
    return db;
  }

  deleteDB() async {
    await _userdatabase?.close();
    _userdatabase = null;
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "custom_foods.db");
    deleteDatabase(path);
  }

  Future<List<Food>> getFoodsWithCustom(Region region, {List<Food>? origFoods}) async {
    final Database db = await userdatabase;

    List<Food> allFoods = origFoods ?? await DBProvider.db.getFoods(region);

    final List<Map<String, dynamic>> results = await db.rawQuery("""
      SELECT food_id, avLocal, avLand, avSea, avAir
      FROM food_region_availability WHERE region_id = ?
      """, [region.id]);

    return results.map((item) {
          String foodId = item['food_id'];

          //throws on error
          Food dbFood = allFoods.firstWhere((element) => element.id == foodId);

          String type = dbFood.typeInfo;
          String assetImgPath = dbFood.assetImgPath;
          String assetImgSourceUrl = dbFood.assetImgSourceUrl;
          String assetImgInfo = dbFood.assetImgInfo;

          int isCommon = dbFood.isCommon ? 1 : 0;
          String avLocal = item['avLocal'] ?? ",,,,,,,,,,,";
          String avLand = item['avLand'] ?? ",,,,,,,,,,,";
          String avSea = item['avSea'] ?? ",,,,,,,,,,,";
          String avAir = item['avAir'] ?? ",,,,,,,,,,,";

          String foodNamesString = dbFood.displayName;
          for (String syn in dbFood.synonyms) {
            foodNamesString += ",$syn";
          }
          String infoUrl = dbFood.infoUrl;

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
        })
        .whereNotNull()
        .toList();
  }


  Future<void> addCustomAvailability(Food f) async {
    final Database db = await userdatabase;

    var avLocal = availabilitiesToString(f.availabilities['local']!);
    var avLand = availabilitiesToString(f.availabilities['landTransport']!);
    var avSea = availabilitiesToString(f.availabilities['seaTransport']!);
    var avAir = availabilitiesToString(f.availabilities['flightTransport']!);

    await db.rawQuery("""
        INSERT OR REPLACE INTO food_region_availability
        (food_id, avLocal, avLand, avSea, avAir, region_id) VALUES (?,?,?,?,?,?)""",
        [f.id, avLocal, avLand, avSea, avAir, f.region.id]);
  }

  Future<void> revertCustomAvailability(Food f) async {
    final Database db = await userdatabase;

    await db.rawQuery("""
        DELETE FROM food_region_availability
        WHERE food_id = ? AND region_id = ?""",
        [f.id, f.region.id]);

  }
}
