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

const List<Availability> naList = [n, n, n, n, n, n, n, n, n, n, n, n];

List<Availability> availabilitiesFromJson(List<dynamic> availabilitiesJson) {
  List<Availability> availabilities = new List<Availability>();
  availabilitiesJson.forEach((av) {
    availabilities.add(fromDouble(av.toDouble()));
  });
  return availabilities;
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

List<Food> getFoodsFromFoodNames(List<String> foodNames, List<Food> allFoods) {
  List<Food> matchingFoods = new List();
  Map<String, Food> allFoodsMap = Map.fromIterable(allFoods,
      key: (food) => food.name, value: (food) => food);
  foodNames.forEach((foodName) {
    if (allFoodsMap.containsKey(foodName)) {
      matchingFoods.add(allFoodsMap[foodName]);
    }
  });
  return matchingFoods;
}

List<Food> getFoodsFromJson(Map<String, dynamic> foodsJson) {
  List<Food> allFoods = List<Food>();
  foodsJson.forEach((foodKey, foodDict) {
    List<Availability> local = foodDict.containsKey("local")
      ? availabilitiesFromJson(foodDict['local'])
      : naList;
    List<Availability> landTransport = foodDict.containsKey("landTransport")
      ? availabilitiesFromJson(foodDict['landTransport'])
      : naList;
    List<Availability> seaTransport = foodDict.containsKey("seaTransport")
      ? availabilitiesFromJson(foodDict['seaTransport'])
      : naList;
    List<Availability> flightTransport = foodDict.containsKey("flightTransport")
      ? availabilitiesFromJson(foodDict['flightTransport'])
      : naList;
    allFoods.add(new Food(foodDict["name"], foodDict["img"], foodDict["infoURL"],
        foodDict["isCommon"], foodDict["type"],
        local: local,
        landTransport: landTransport,
        seaTransport: seaTransport,
        flightTransport: flightTransport));
  });
  return allFoods;
}

class Food {
  String name = "null";
  String assetImgPath = "";
  String infoURL = "";
  bool isCommon = true;
  String type = "none";
  LinkedHashMap<String, List<Availability>> _availabilities =
      new LinkedHashMap();

  Food(String name, String assetImgPath, String infoURL, int isCommon, String type,
      {List<Availability> local = naList,
      List<Availability> landTransport = naList,
      List<Availability> seaTransport = naList,
      List<Availability> flightTransport = naList}) {
    this.name = name;
    this.assetImgPath = assetImgPath;
    this.infoURL = infoURL;
    this.isCommon = isCommon == 1;
    this.type = type;
    this._availabilities["local"] = local;
    this._availabilities["landTransport"] = landTransport;
    this._availabilities["seaTransport"] = seaTransport;
    this._availabilities["flightTransport"] = flightTransport;
  }

  List<String> getAvailabilityModes(int monthIndex) {
    LinkedHashMap<String, Availability> availabilitiesThisMonth =
        LinkedHashMap();
    this._availabilities.keys.forEach((key) {
      availabilitiesThisMonth[key] = this._availabilities[key][monthIndex];
    });

    List<String> resultModes = new List();
    availabilitiesThisMonth.keys.forEach((key) {
      Availability curModeAv = availabilitiesThisMonth[key];
      if (curModeAv != Availability.none) {
        resultModes.add(key);
      }
      if (curModeAv == Availability.full || resultModes.length >= 2) {
        return resultModes; // TODO break instead?
      }
    });
    if (resultModes.length == 0) {
      return ["notAvailable"];
    } else {
      return resultModes;
    }
  }
}
