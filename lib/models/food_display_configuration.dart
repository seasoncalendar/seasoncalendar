import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/app_config.dart';
import 'package:seasoncalendar/helpers/db_provider.dart';
import 'package:seasoncalendar/helpers/user_db_provider.dart';

import 'package:seasoncalendar/models/availability.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/helpers/favorite_foods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:seasoncalendar/helpers/json_asset_loader.dart';

Future<List<Object>> foodDisplayConfigurationFuture() async {
  var origFoods = await DBProvider.db.getFoods();
  var customFoods = await UserDBProvider.db.getFoodsWithCustom(origFoods: origFoods);
  var favFoodIds = await getFavoriteFoods();
  return [origFoods, customFoods, favFoodIds];
}

class FoodDisplayConfiguration extends ChangeNotifier {
  List<Food> allFoods = [];
  List<String> favoriteFoodIds = [];
  List<Food> foodsToDisplay = [];
  bool favoritesSelected = false;
  int monthIndex = DateTime.now().toLocal().month - 1;
  late AppConfig config;

  FoodDisplayConfiguration.async(AppConfig config, List<dynamic> res) {
    setFromFeature(config, res);
  }

  update(AppConfig config) {
      foodDisplayConfigurationFuture().then((res) {
        setFromFeature(config, res);
      });
  }

  setFromFeature(AppConfig config, List<dynamic> res) {
    this.config = config;
    if (config.useCustomAv) {
      // use foods merged with custom entries
      allFoods = res[1] as List<Food>;
    } else {
      // use default food entries
      allFoods = res[0] as List<Food>;
    }
    favoriteFoodIds = res[2] as List<String>;
    foodsToDisplay = _getFilteredAndSortedFoods(config.getPreferences());
    notifyListeners();
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
    bool fruitsSelected = config.getValue("showFruits");
    config.setValue("showFruits", !fruitsSelected);
    updateFoodsAndNotify();
  }

  void toggleVegetablesSelected() async {
    bool vegetablesSelected = config.getValue("showVegetables");
    config.setValue("showVegetables", !vegetablesSelected);
    updateFoodsAndNotify();
  }

  updateFoodsAndNotify() async {
    favoriteFoodIds = await getFavoriteFoods();
    foodsToDisplay = _getFilteredAndSortedFoods(config.getPreferences());
    notifyListeners();
  }

  bool showFoodPredicate(Food f, int month, Map<String, dynamic> settings) {
    // favorites only?
    if (favoritesSelected && !favoriteFoodIds.contains(f.id)) {
      return false;
    }
    if (settings['includeUncommon'] == false && !f.isCommon) {
      return false;
    }
    if (!settings["showFruits"] && f.isFruit()) {
      return false;
    }
    if (!settings["showVegetables"] && f.isVegetable()) {
      return false;
    }
    List<Availability> avails = f.getAvailabilitiesByMonth(monthIndex, short: true);
    var isUnknown = avails.every((a) => a == Availability.unknown);
    if (settings["showUnknown"] && isUnknown) {
      return true;
    }
    // non of the exclusion criteria now try inclusion criteria
    var isUnavailable = avails.every((a) => a == Availability.none || a == Availability.unknown);
    if (settings["showUnavailable"] && isUnavailable) {
      return true;
    }
    // meets selected availabilities?
    bool hasSelectedAv = Iterable.generate(avails.length, (i) {
      return isAvailable(avails[i]) && settings[avSettingsKeys[i]] && true;
    }).any((el) => el);
    if (hasSelectedAv) {
      return true;
    }
    return false;
  }

  List<Food> _getFilteredAndSortedFoods(Map<String, dynamic> settings) {
    // start with all possible foods...
    // filter for the current month by the display settings
    var filteredFoods = allFoods.where((f) {
      return showFoodPredicate(f, monthIndex, settings);
    }).toList();
    // sort remaining foods, first by display name.
    filteredFoods.sort((a, b) => a.displayName.compareTo(b.displayName));
    // and if specified sort by availability
    if (settings['foodSorting'] == true) {
      filteredFoods.sort((a, b) {
        var av1 = a.getAvailabilitiesByMonth(monthIndex, short: true);
        var av2 = b.getAvailabilitiesByMonth(monthIndex, short: true);
        int comp = compareAvailabilities(av1, av2);
        if (comp != 0) {
          return comp;
        } else {
          return a.displayName.compareTo(b.displayName);
        }
      });
    }
    return filteredFoods;
  }
}
