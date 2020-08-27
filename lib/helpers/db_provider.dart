import 'package:seasoncalendar/models/food.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'dart:io';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "foods.db");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

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
    } else {
      print("Opening existing database");
    }
    // open the database
    var res = await openDatabase(path, readOnly: true);
    return res;
  }

  Future<dynamic> getFoods() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('foods');

    return List.generate(maps.length, (i) {
      String foodId = maps[i]['id'];
      String displayName = maps[i]['displayName'];
      String synonymString = maps[i]['synonyms'];
      String type = maps[i]['type'];
      int isCommon = maps[i]['isCommon'];
      String avLocal = maps[i]['avLocal'];
      String avLand = maps[i]['avLand'];
      String avSea = maps[i]['avSea'];
      String avAir = maps[i]['avAir'];
      String infoUrl = maps[i]['infoUrl'];
      String assetImgPath = maps[i]['assetImgPath'];
      String assetImgSourceUrl = maps[i]['assetImgSourceUrl'];
      String assetImgInfo = maps[i]['assetImgInfo'];

      return Food(
          foodId,
          displayName,
          synonymString,
          type,
          isCommon,
          avLocal,
          avLand,
          avSea,
          avAir,
          infoUrl,
          assetImgPath,
          assetImgSourceUrl,
          assetImgInfo);
    });
  }
}
