import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/components/favorite_foods.dart';

class FoodDisplayConfiguration extends StatefulWidget {
  final List<Food> allFoods;
  final List<dynamic> monthNames;
  final _initialSettings;
  final _initialFavoriteFoodNames;

  FoodDisplayConfiguration(List<Food> allFoods, List<dynamic> monthNames,
      Map<String, dynamic> settings, List<String> favoriteFoodNames)
      : allFoods = allFoods,
        monthNames = monthNames,
        _initialSettings = settings,
        _initialFavoriteFoodNames = favoriteFoodNames;

  @override
  FoodDisplayConfigurationState createState() =>
      FoodDisplayConfigurationState();
}

class FoodDisplayConfigurationState extends State<FoodDisplayConfiguration> {
  bool favoritesSelected = false;
  bool fruitsSelected = true;
  bool nonFruitsSelected = true;
  int monthIndex = DateTime.now().toLocal().month - 1;

  List<Food> foodsToDisplay;
  Map<String, dynamic> _settings;
  List<String> _favoriteFoodNames;

  @override
  void initState() {
    super.initState();
    setState(() {
      foodsToDisplay = widget.allFoods;
      _settings = widget._initialSettings;
      _favoriteFoodNames = widget._initialFavoriteFoodNames;
      foodsToDisplay =
          _getFilteredAndSortedFoods(_favoriteFoodNames, _settings);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  setMonth(int value) {
    setState(() {
      monthIndex = value % 12;
    });
    filterAndSortFoodsAsync();
  }

  shiftMonth(int value) {
    setState(() {
      monthIndex = (monthIndex + value) % 12;
    });
    filterAndSortFoodsAsync();
  }

  void toggleFavoritesSelected() async {
    setState(() {
      favoritesSelected = !favoritesSelected;
    });
    filterAndSortFoodsAsync();
  }

  void toggleFruitsSelected() async {
    setState(() {
      if (!fruitsSelected) {
        fruitsSelected = true;
      } else if (nonFruitsSelected) {
        nonFruitsSelected = false;
      } else {
        nonFruitsSelected = true;
      }
    });
    filterAndSortFoodsAsync();
  }

  void toggleNonFruitsSelected() async {
    setState(() {
      if (!nonFruitsSelected) {
        nonFruitsSelected = true;
      } else if (fruitsSelected) {
        fruitsSelected = false;
      } else {
        fruitsSelected = true;
      }
    });
    filterAndSortFoodsAsync();
  }

  filterAndSortFoodsAsync() async {
    final favoriteFoodIds = await getFavoriteFoods();
    Map<String, dynamic> settings = await SettingsPageState.getSettings();
    setState(() {
      foodsToDisplay = _getFilteredAndSortedFoods(favoriteFoodIds, settings);
    });
  }

  List<Food> _getFilteredAndSortedFoods(
      List<String> favoriteFoodIds, Map<String, dynamic> settings) {
    List<Food> filteredFoods = widget.allFoods;

    if (favoritesSelected) {
      filteredFoods = getFoodsFromIds(favoriteFoodIds, widget.allFoods);
    }
    if (settings['includeUncommon'] == false) {
      filteredFoods = filteredFoods.where((food) => food.isCommon).toList();
    }
    if (!fruitsSelected) {
      filteredFoods =
          filteredFoods.where((food) => food.type != "fruit").toList();
    }
    if (!nonFruitsSelected) {
      filteredFoods =
          filteredFoods.where((food) => food.type != "nonFruit").toList();
    }
    filteredFoods = filteredFoods
        .where((food) =>
            [
              for (String av in food.getAvailabilityModes(monthIndex))
                availabilityModeValues[av]
            ].reduce(max) >=
            settings['foodMinAvailability'])
        .toList();
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
