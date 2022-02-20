import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:seasoncalendar/models/availability.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/helpers/favorite_foods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:seasoncalendar/helpers/json_asset_loader.dart';

class FoodDisplayConfiguration extends ChangeNotifier {
  final List<Food> allFoods;
  List<String> favoriteFoodNames;
  late List<Food> foodsToDisplay;
  bool favoritesSelected = false;
  int monthIndex = DateTime.now().toLocal().month - 1;

  FoodDisplayConfiguration(List<Food> initialFoods,
      Map<String, dynamic> settings, List<String> initialFavoriteFoodNames)
      : allFoods = initialFoods,
        favoriteFoodNames = initialFavoriteFoodNames {
    foodsToDisplay = _getFilteredAndSortedFoods(favoriteFoodNames, settings);
  }

  setMonth(int value) {
    monthIndex = value % 12;
    updateFoodsAndNotify();
  }

  shiftMonth(int value) {
    monthIndex = (monthIndex + value) % 12;
    updateFoodsAndNotify();
  }

  void toggleFavoritesSelected() async {
    favoritesSelected = !favoritesSelected;
    updateFoodsAndNotify();
  }

  void toggleFruitsSelected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final initialSettings =
        await loadAssetFromJson("assets/initialsettings.json");
    bool fruitsSelected =
        prefs.getBool("showFruits") ?? initialSettings["showFruits"];
    prefs.setBool("showFruits", !fruitsSelected);
    updateFoodsAndNotify();
  }

  void toggleVegetablesSelected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final initialSettings =
        await loadAssetFromJson("assets/initialsettings.json");
    bool vegetablesSelected =
        prefs.getBool("showVegetables") ?? initialSettings["showVegetables"];
    prefs.setBool("showVegetables", !vegetablesSelected);
    updateFoodsAndNotify();
  }

  updateFoodsAndNotify() async {
    final favoriteFoodIds = await getFavoriteFoods();
    Map<String, dynamic> settings = await SettingsPageState.getSettings();
    foodsToDisplay = _getFilteredAndSortedFoods(favoriteFoodIds, settings);
    notifyListeners();
  }

  List<Food> _getFilteredAndSortedFoods(
      List<String> favFoodIds, Map<String, dynamic> settings) {
    // start with all possible foods...
    List<Food> filteredFoods = allFoods;

    // favorites only?
    if (favoritesSelected) {
      filteredFoods = getFoodsFromIds(favFoodIds, allFoods);
    }

    // common foods only?
    if (settings['includeUncommon'] == false) {
      filteredFoods = filteredFoods.where((food) => food.isCommon).toList();
    }

    // filter out food types that shall not be displayed
    filteredFoods = filteredFoods
        .where((food) =>
            food.isFruit() && settings["showFruits"] ||
            food.isVegetable() && settings["showVegetables"])
        .toList();

    // meets selected availabilities?
    List<bool> selectedAvs =
        List.generate(avTypeCount, (i) => settings[avSettingsKeys[i]]);
    filteredFoods = filteredFoods.where((food) {
      List<bool> foodAvs = food
          .getAvailabilitiesByMonth(monthIndex)
          .map((mode) => mode != Availability.none)
          .toList();
      return List.generate(foodAvs.length, (i) => selectedAvs[i] && foodAvs[i])
          .contains(true);
    }).toList();

    // sort remaining foods, first by display name.
    filteredFoods.sort((a, b) => a.displayName.compareTo(b.displayName));

    if (settings['foodSorting'] == true) {
      filteredFoods.sort((a, b) {
        var av1 = a.getAvailabilitiesByMonth(monthIndex);
        var av2 = b.getAvailabilitiesByMonth(monthIndex);
        int comp = compareAvailabilities(av1, av2);
        if (comp != 0) {
          return comp;
        }
        else {
          return a.displayName.compareTo(b.displayName);
        }
      });
    }

    return filteredFoods;
  }
}
