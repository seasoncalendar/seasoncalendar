import 'dart:collection';

import 'package:flutter/material.dart';

enum Availability { none, some, full }

const Availability n = Availability.none;
const Availability s = Availability.some;
const Availability f = Availability.full;

Availability fromDouble(double val) {
  if (val == 0.0) return n;
  if (val == 1.0)
    return f;
  else
    return s;
}

const Map<String, IconData> availabilityModeIcons = {
  "local": Icons.home,
  "landTransport": Icons.local_shipping,
  "seaTransport": Icons.directions_boat,
  "flightTransport": Icons.airplanemode_active,
  "notAvailable": Icons.remove,
};
Map<String, Color> availabilityModeColor = {
  "local": Colors.lightGreenAccent[100],
  "landTransport": Colors.lime[200],
  "seaTransport": Colors.yellowAccent[100],
  "flightTransport": Colors.orangeAccent[100],
  "notAvailable": Colors.grey[200],
};
const Map<String, double> availabilityModeValues = {
  "local": 3,
  "landTransport": 2,
  "seaTransport": 1,
  "flightTransport": 0,
  "notAvailable": -1,
};

List<Food> getFoodsFromIds(List<String> foodIds, List<Food> allFoods) {
  List<Food> matchingFoods = new List();
  Map<String, Food> allFoodsMap = Map.fromIterable(allFoods,
      key: (food) => food.id, value: (food) => food);
  foodIds.forEach((id) {
    if (allFoodsMap.containsKey(id)) {
      matchingFoods.add(allFoodsMap[id]);
    }
  });
  return matchingFoods;
}

List<String> splitByCommaAndTrim(String stringifiedList) {
  List<String> res = List<String>();
  stringifiedList.split(",").forEach((elem) {
    res.add(elem.trim());
  });
  return res;
}

List<Availability> availabilitiesFromStringList(List<String> avStringList) {
  List<Availability> availabilities = new List<Availability>();
  avStringList.forEach((av) {
    double avDouble = double.tryParse(av);
    availabilities.add(fromDouble(avDouble ?? 0.0));
  });
  return availabilities;
}

class Food {
  String id;
  String displayName;
  List<String> synonyms;
  String type;
  bool isCommon;
  LinkedHashMap<String, List<Availability>> availabilities;
  String infoUrl;
  String assetImgPath;
  String assetImgSourceUrl;
  String assetImgInfo;

  Food(
      String id,
      String displayName,
      String synonymString,
      String type,
      int isCommon,
      String avLocal,
      String avLand,
      String avSea,
      String avAir,
      String infoUrl,
      String assetImgPath,
      String assetImgSourceUrl,
      String assetImgInfo)
      : this.id = id,
        this.displayName = displayName,
        this.type = type,
        this.isCommon = isCommon == 1,
        this.infoUrl = infoUrl,
        this.assetImgPath = assetImgPath,
        this.assetImgSourceUrl = assetImgSourceUrl,
        this.assetImgInfo = assetImgInfo {
    // handle synonyms
    this.synonyms = splitByCommaAndTrim(synonymString);

    // handle availabilities
    this.availabilities = LinkedHashMap<String, List<Availability>>();
    this.availabilities['local'] =
        availabilitiesFromStringList(splitByCommaAndTrim(avLocal));
    this.availabilities['landTransport'] =
        availabilitiesFromStringList(splitByCommaAndTrim(avLand));
    this.availabilities['seaTransport'] =
        availabilitiesFromStringList(splitByCommaAndTrim(avSea));
    this.availabilities['flightTransport'] =
        availabilitiesFromStringList(splitByCommaAndTrim(avAir));
  }

  List<String> getAvailabilityModes(int monthIndex) {
    LinkedHashMap<String, Availability> availabilitiesThisMonth =
        LinkedHashMap();
    this.availabilities.keys.forEach((key) {
      availabilitiesThisMonth[key] = this.availabilities[key][monthIndex];
    });

    List<String> resultModes = new List();
    for (var key in availabilitiesThisMonth.keys) {
      Availability curModeAv = availabilitiesThisMonth[key];
      if (curModeAv != Availability.none) {
        resultModes.add(key);
      }
      if (curModeAv == Availability.full || resultModes.length >= 2) {
        return resultModes;
      }
    }

    if (resultModes.length == 0) {
      return ["notAvailable"];
    } else {
      return resultModes;
    }
  }
}
