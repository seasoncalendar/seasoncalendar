import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:seasoncalendar/models/region.dart';

enum Availability { none, some, full }

const Availability n = Availability.none;
const Availability s = Availability.some;
const Availability f = Availability.full;

Availability _fromDouble(double val) {
  if (val == 0.0) return n;
  if (val == 1.0) return f;
  return s;
}

double _toDouble(Availability av) {
  if (av == n) return 0.0;
  if (av == f) return 1.0;
  return 0.5;
}

int compareAvailabilities(List<Availability> av1, List<Availability> av2) {
  // ASSUMING: av1.length == av2.length
  for (int i = 0; i < av1.length; ++i) {
    int comp = _toDouble(av2[i]).compareTo(_toDouble(av1[i]));
    if (comp != 0) return comp;
  }
  return 0;
}

int getIconAlphaFromAvailability(Availability av) {
  if (av == n) return 230;
  if (av == f) return 200;
  return 120;
}

const Map<Availability, double> availabilityToIconAlphaFactor = {
  Availability.none: 1.0,
  Availability.full: 1.0,
  Availability.some: 0.5
};

const Map<int, IconData> availabilityModeIcons = {
  0: Icons.home,
  1: Icons.local_shipping,
  2: Icons.directions_boat,
  3: Icons.airplanemode_active,
  -1: Icons.remove,
};
Map<int, Color> availabilityModeColor = {
  0: Colors.lightGreenAccent[100]!,
  1: Colors.lime[200]!,
  2: Colors.yellowAccent[100]!,
  3: Colors.orangeAccent[100]!,
  -1: Colors.grey[200]!,
};
const Map<String, int> availabilityModeValues = {
  "local": 0,
  "landTransport": 1,
  "seaTransport": 2,
  "flightTransport": 3,
  "notAvailable": -1,
};

List<Food> getFoodsFromIds(List<String> foodIds, List<Food> allFoods) {
  var matchingFoods = List<Food>.empty(growable: true);
  Map<String, Food> allFoodsMap = {
    for (var food in allFoods)
      food.id: food,
  };
  for (var id in foodIds) {
    if (allFoodsMap.containsKey(id)) {
      matchingFoods.add(allFoodsMap[id]!);
    }
  }
  return matchingFoods;
}

List<String> splitByCommaAndTrim(String stringifiedList) {
  return stringifiedList.split(",").map((elem) => elem.trim()).toList();
}

List<Availability> availabilitiesFromStringList(List<String> avStringList) {
  return avStringList
      .map((str) => _fromDouble(double.tryParse(str) ?? 0.0))
      .toList();
}

class Food {
  String id;
  String displayName = "...";
  List<String> synonyms = List.empty();
  String typeInfo;
  bool isCommon;
  LinkedHashMap<String, List<Availability>> availabilities = LinkedHashMap();
  String infoUrl;
  String assetImgPath;
  String assetImgSourceUrl;
  String assetImgInfo;
  Region region;

  Food(
      this.id,
      String foodNamesString,
      this.typeInfo,
      int commonInt,
      String avLocal,
      String avLand,
      String avSea,
      String avAir,
      this.infoUrl,
      this.assetImgPath,
      this.assetImgSourceUrl,
      this.assetImgInfo,
      this.region)
      : isCommon = commonInt == 1 {
    // handle names and synonyms
    synonyms = splitByCommaAndTrim(foodNamesString);
    displayName = synonyms[0];

    // handle availabilities
    availabilities = LinkedHashMap<String, List<Availability>>();
    availabilities['local'] =
        availabilitiesFromStringList(splitByCommaAndTrim(avLocal));
    availabilities['landTransport'] =
        availabilitiesFromStringList(splitByCommaAndTrim(avLand));
    availabilities['seaTransport'] =
        availabilitiesFromStringList(splitByCommaAndTrim(avSea));
    availabilities['flightTransport'] =
        availabilitiesFromStringList(splitByCommaAndTrim(avAir));
  }

  List<Availability> getAvailabilitiesByMonth(int monthIndex) {
    List<Availability> availabilitiesThisMonth = [
      Availability.none,
      Availability.none,
      Availability.none,
      Availability.none
    ];

    var avKeys = availabilities.keys.toList();
    for (int i = 0; i < avKeys.length; ++i) {
      var curKey = avKeys[i];
      var curAv = availabilities[curKey]![monthIndex];
      availabilitiesThisMonth[availabilityModeValues[curKey]!] = curAv;

      // lower av modes are disregarded if any mode is "full"
      if (curAv == f) break;
    }

    return availabilitiesThisMonth;
  }

  bool isFruit() => typeInfo.toLowerCase().contains("fruit");
  bool isVegetable() => typeInfo.toLowerCase().contains("vegetable");
}
