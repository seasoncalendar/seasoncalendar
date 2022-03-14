import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';

import 'app_config.dart';
import 'helpers/db_provider.dart';
import 'helpers/user_db_provider.dart';
import 'models/availability.dart';
import 'models/food.dart';

Future<List<Object>> appDataFuture(AppConfig config) async {
  var origFoods = await DBProvider.db.getFoods(config.curRegion);
  var customFoods = await UserDBProvider.db.getFoodsWithCustom(config.curRegion, origFoods: origFoods);
  var allFoods = mergeCustomFoods(origFoods, customFoods);
  return [origFoods, allFoods];
}

List<Food> mergeCustomFoods(List<Food> origFoods, List<Food> customFoods) {
  var res = List.generate(origFoods.length, (i) => Food.copy(origFoods[i]));
  for (var food in res) {
    var match = customFoods.firstWhereOrNull((f) => f.id == food.id);
    if (match != null) {
      food.isEdited = true;
      food.availabilities = LinkedHashMap.from(
          food.availabilities.map((key, value) =>
              MapEntry(key, overrideAvailabilities(value, match.availabilities[key]!))
          ));
    } else {
      food.isEdited = false;
    }
  }
  return res;
}

class AppData extends ChangeNotifier {
  List<Food> origFoods;
  late List<Food> curFoods;
  late AppConfig config;

  AppData.fromAsync(AppConfig config, List<dynamic> asyncRes)
  : origFoods = asyncRes[0] {
    setFromFeature(config, asyncRes);
  }

  update(AppConfig config) async {
    var asyncRes = await appDataFuture(config);
    setFromFeature(config, asyncRes);
  }

  setFromFeature(AppConfig config, List<dynamic> asyncRes) {
    this.config = config;
    origFoods = asyncRes[0];
    if (config.useCustomAv) {
      // use foods merged with custom entries
      curFoods = asyncRes[1] as List<Food>;
    } else {
      // use default food entries
      curFoods = origFoods;
    }
    notifyListeners();
  }

  static AppData of(BuildContext context, {bool listen = true}) {
    return Provider.of<AppData>(context, listen: listen);
  }

  Future<void> changeAvailability(Food food, int monthIndex, List<Availability> ret) async {
    food.changeAvailabilitiesForMonth(ret, monthIndex);
    food.isEdited = true;
    await UserDBProvider.db.addCustomAvailability(food);
    notifyListeners();
  }

  Future<void> revertAvailabilities(Food food) async {
    var orig = origFoods.firstWhere((e) => e.id == food.id);
    food.availabilities = LinkedHashMap.from(
        food.availabilities.map((key, value) =>
            MapEntry(key, List.of(orig.availabilities[key]!))
        ));
    food.isEdited = false;
    await UserDBProvider.db.revertCustomAvailability(food);
    notifyListeners();
  }

  Future<void> deleteCustomAvailabilities() async {
    await UserDBProvider.db.deleteDB();
    setFromFeature(config, await appDataFuture(config));
  }
}