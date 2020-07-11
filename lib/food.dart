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

const Map<String, Icon> availabilityModeIcons = {
  "localSeason": Icon(Icons.home, color: Colors.green),
  "localStorage": Icon(Icons.home),
  "landTransportSeason": Icon(
    Icons.local_shipping,
    color: Colors.green,
  ),
  "landTransportStorage": Icon(Icons.local_shipping),
  "seaTransportAvailable": Icon(Icons.directions_boat),
  "flightTransportAvailable": Icon(Icons.airplanemode_active),
  "notAvailable": Icon(Icons.remove),
};
Map<String, Color> availabilityModeColor = {
  "localSeason": Colors.lightGreenAccent[100],
  "localStorage": Colors.lightGreenAccent[100],
  "landTransportSeason": Colors.lime[50],
  "landTransportStorage": Colors.limeAccent[100],
  "seaTransportAvailable": Colors.yellowAccent[100],
  "flightTransportAvailable": Colors.orangeAccent[100],
  "notAvailable": Colors.grey[200],
};
const Map<String, double> availabilityModeValues = {
  "localSeason": 3.5,
  "localStorage": 3,
  "landTransportSeason": 2.5,
  "landTransportStorage": 2,
  "seaTransportAvailable": 1,
  "flightTransportAvailable": 0,
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
    List<Availability> localSeason = foodDict.containsKey("localSeason")
      ? availabilitiesFromJson(foodDict['localSeason'])
      : naList;
    List<Availability> localStorage = foodDict.containsKey("localStorage")
      ? availabilitiesFromJson(foodDict['localStorage'])
      : naList;
    List<Availability> landTransportSeason = foodDict.containsKey("landTransportSeason")
      ? availabilitiesFromJson(foodDict['landTransportSeason'])
      : naList;
    List<Availability> landTransportStorage = foodDict.containsKey("landTransportStorage")
      ? availabilitiesFromJson(foodDict['landTransportStorage'])
      : naList;
    List<Availability> seaTransportAvailable = foodDict.containsKey("seaTransportAvailable")
      ? availabilitiesFromJson(foodDict['seaTransportAvailable'])
      : naList;
    List<Availability> flightTransportAvailable = foodDict.containsKey("flightTransportAvailable")
      ? availabilitiesFromJson(foodDict['flightTransportAvailable'])
      : naList;
    allFoods.add(new Food(foodDict["name"], foodDict["img"],
        localSeason: localSeason,
        localStorage: localStorage,
        landTransportSeason: landTransportSeason,
        landTransportStorage: landTransportStorage,
        seaTransportAvailable: seaTransportAvailable,
        flightTransportAvailable: flightTransportAvailable));
  });
  return allFoods;
}

class Food {
  String name;
  String assetImgPath = "";
  LinkedHashMap<String, List<Availability>> _availabilities =
      new LinkedHashMap();

  Food(String name, String assetImgPath,
      {List<Availability> localSeason = naList,
      List<Availability> localStorage = naList,
      List<Availability> landTransportSeason = naList,
      List<Availability> landTransportStorage = naList,
      List<Availability> seaTransportAvailable = naList,
      List<Availability> flightTransportAvailable = naList}) {
    this.name = name;
    this.assetImgPath = assetImgPath;
    this._availabilities["localSeason"] = localSeason;
    this._availabilities["localStorage"] = localStorage;
    this._availabilities["landTransportSeason"] = landTransportSeason;
    this._availabilities["landTransportStorage"] = landTransportStorage;
    this._availabilities["seaTransportAvailable"] = seaTransportAvailable;
    this._availabilities["flightTransportAvailable"] = flightTransportAvailable;
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
