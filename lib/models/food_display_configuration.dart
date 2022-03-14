import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seasoncalendar/app_config.dart';
import 'package:seasoncalendar/app_data.dart';
import 'package:seasoncalendar/models/availability.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/helpers/favorite_foods.dart';

Future<List<Object>> foodDisplayConfigurationFuture() async {
  var favFoodIds = await getFavoriteFoods();
  return [favFoodIds];
}

class FoodDisplayConfiguration extends ChangeNotifier {
  late AppConfig config;
  late AppData data;
  List<String> favoriteFoodIds = [];
  List<Food> foodsToDisplay = [];
  bool favoritesSelected = false;
  int monthIndex = DateTime.now().toLocal().month - 1;

  FoodDisplayConfiguration.async(AppConfig config, AppData data, List<dynamic> res) {
    setFromFeature(config, data, res);
  }

  static FoodDisplayConfiguration of(BuildContext context, {bool listen = true}) {
    return Provider.of<FoodDisplayConfiguration>(context, listen: listen);
  }

  update(AppConfig config, AppData data) async {
     var res = await foodDisplayConfigurationFuture();
     setFromFeature(config, data, res);
  }

  setFromFeature(AppConfig config, AppData data, List<dynamic> res) {
    this.config = config;
    this.data = data;
    favoriteFoodIds = res[0] as List<String>;
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

  bool get fruitsSelected {
    return config.getValue("showFruits");
  }

  bool get vegetablesSelected {
    return config.getValue("showVegetables");
  }

  void toggleFavoritesSelected() async {
    favoritesSelected = !favoritesSelected;
    updateFoodsAndNotify();
  }

  void toggleFruitsSelected() async {
    config.setValue("showFruits", !fruitsSelected);
    updateFoodsAndNotify();
  }

  void toggleVegetablesSelected() async {
    config.setValue("showVegetables", !vegetablesSelected);
    updateFoodsAndNotify();
  }

  void updateFoodsAndNotify() async {
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
    if (!fruitsSelected && f.isFruit()) {
      return false;
    }
    if (!vegetablesSelected && f.isVegetable()) {
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
    var filteredFoods = data.curFoods.where((f) {
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
