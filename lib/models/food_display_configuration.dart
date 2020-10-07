import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/components/favorite_foods.dart';

class FoodDisplayConfiguration extends ChangeNotifier {
  final List<Food> allFoods;
  var favoriteFoodNames;
  var foodsToDisplay;
  bool favoritesSelected = false;
  bool fruitsSelected = true;
  bool nonFruitsSelected = true;
  int monthIndex = DateTime.now().toLocal().month - 1;

  FoodDisplayConfiguration(
      List<Food> initialFoods,
      Map<String, dynamic> initialSettings,
      List<String> initialFavoriteFoodNames)
      : allFoods = initialFoods {
    favoriteFoodNames = initialFavoriteFoodNames;
    foodsToDisplay =
        _getFilteredAndSortedFoods(favoriteFoodNames, initialSettings);
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
    if (!fruitsSelected) {
      fruitsSelected = true;
    } else if (nonFruitsSelected) {
      nonFruitsSelected = false;
    } else {
      nonFruitsSelected = true;
    }
    updateFoodsAndNotify();
  }

  void toggleNonFruitsSelected() async {
    if (!nonFruitsSelected) {
      nonFruitsSelected = true;
    } else if (fruitsSelected) {
      fruitsSelected = false;
    } else {
      fruitsSelected = true;
    }
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

    // filter out fruits?
    if (!fruitsSelected) {
      filteredFoods =
          filteredFoods.where((food) => food.type != "fruit").toList();
    }

    // filter out non-fruits?
    if (!nonFruitsSelected) {
      filteredFoods =
          filteredFoods.where((food) => food.type != "nonFruit").toList();
    }

    // meets min availability?
    filteredFoods = filteredFoods
        .where((food) =>
            [
              for (String av in food.getAvailabilityModes(monthIndex))
                availabilityModeValues[av]
            ].reduce(max) >=
            settings['foodMinAvailability'])
        .toList();

    // sort remaining foods
    filteredFoods.sort((a, b) => a.displayName.compareTo(b.displayName));
    if (settings['foodSorting'] == true) {
      filteredFoods.sort((a, b) {
        int comp = [
          for (String av in b.getAvailabilityModes(monthIndex))
            availabilityModeValues[av]
        ].reduce(max).compareTo([
              for (String av in a.getAvailabilityModes(monthIndex))
                availabilityModeValues[av]
            ].reduce(max));
        if (comp != 0)
          return comp;
        else
          return a.displayName.compareTo(b.displayName);
      });
    }

    return filteredFoods;
  }
}
