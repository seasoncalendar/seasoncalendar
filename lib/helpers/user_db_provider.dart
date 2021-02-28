import 'package:seasoncalendar/models/region.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/helpers/db_provider.dart';

class UserDBProvider {
  UserDBProvider._();

  static final UserDBProvider db = UserDBProvider._();
  static Database _userdatabase;

  Future<Database> get userdatabase async {
    if (_userdatabase == null) {
      _userdatabase = await initDB();
    }
    return _userdatabase;
  }

  _onOpen(Database db) async {
    // Database is open, print its version
    print('db version ${await db.getVersion()}');
  }

  _onCreate(Database db, int version) async {
    // Database is created, create the table
    await db.execute(
        "CREATE TABLE food_region_availability (food_id	TEXT NOT NULL, region_id TEXT NOT NULL, avLocal	TEXT, avLand	TEXT, avSea	TEXT, avAir	TEXT, PRIMARY KEY(food_id, region_id))");
    print('created user db');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Database version is updated, alter the table
    print('Upgrade from $oldVersion to $newVersion');
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "custom_foods.db");
    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    print('opening db');
    var db = await openDatabase(
      path,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onDowngrade: onDatabaseDowngradeDelete,
      version: 1,
      onOpen: _onOpen,
    );
    print('opened db');
    return db;
  }

  Future<List<Food>> getCustomFoods() async {
    final Database db = await userdatabase;
    Region region = await DBProvider.db.getCurrentRegion();

    final List<Map<String, dynamic>> results = await db.rawQuery("""
      SELECT food_id, avLocal, avLand, avSea, avAir
      FROM food_region_availability WHERE region_id = ?
      """, [region.id]);

    Iterable<Food> allFoods = await DBProvider.db.getFoods();

    results.map((item) {
      String foodId = item['food_id'];

      Food dbFood = allFoods.firstWhere((element) => element.id == foodId,
          orElse: null);
      if (dbFood == null)
        return null;

      String type = dbFood.typeInfo;
      String assetImgPath = dbFood.assetImgPath;
      String assetImgSourceUrl = dbFood.assetImgSourceUrl;
      String assetImgInfo = dbFood.assetImgInfo;

      int isCommon = dbFood.isCommon ? 1 : 0;
      String avLocal = item['avLocal'];
      String avLand = item['avLand'];
      String avSea = item['avSea'];
      String avAir = item['avAir'];

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
    }).where((element) => element != null).toList();
  }

  addCustomFood(Food f) async {
    if (f == null) return;
    final Database db = await userdatabase;

    var settings = await SettingsPageState.getSettings();
    var regionCode = settings['regionCode'];

    var avLocal = f.availabilities['local'];
    var avLand = f.availabilities['landTransport'];
    var avSea = f.availabilities['seaTransport'];
    var avAir = f.availabilities['flightTransport'];


    await db.rawQuery(
        """INSERT OR REPLACE INTO food_region_availability (food_id, avLocal, avLand, avSea, avAir, region_id) VALUES (?,?,?,?,?,?)""",
        [f.id, avLocal, avLand, avSea, avAir, regionCode]);
  }
}
