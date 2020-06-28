import 'dart:collection';

final List<Food> allFoods = [apple, apricot, pear];

enum availability {
  none,
  some,
  full
}

const availability n = availability.none;
const availability s = availability.some;
const availability f = availability.full;
const List<availability> naList = [n, n, n, n, n, n, n, n, n, n, n, n];

List<Food> getFoodsFromFoodNames(List<String> foodNames) {
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

Map <double, String> minAvailabilityIndicator = {
  0: "Keine Einschränkungen",
  1: "Keine eingeflogenen Sorten",
  2: "Keine eingeflogenen Sorten\nKeine eingeschifften Sorten",
  3: "Nur heimische Sorten",
};

class Food {
  String name;
  String assetImgPath = "";
  LinkedHashMap<String, List<availability>> _availabilities = new LinkedHashMap();

  Food(String name, String assetImgPath, {
    List<availability> localSeason = naList,
    List<availability> localStorage = naList,
    List<availability> landTransportSeason = naList,
    List<availability> landTransportStorage = naList,
    List<availability> seaTransportAvailable = naList,
    List<availability> flightTransportAvailable = naList}) {
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
    LinkedHashMap<String, availability> availabilitiesThisMonth = LinkedHashMap();
    this._availabilities.keys.forEach((key) {
      availabilitiesThisMonth[key] = this._availabilities[key][monthIndex];
    });

    List<String> resultModes = new List();
    availabilitiesThisMonth.keys.forEach((key) {
      availability curModeAv = availabilitiesThisMonth[key];
      if (curModeAv != availability.none) {
        resultModes.add(key);
      }
      if (curModeAv == availability.full || resultModes.length >= 2) {
        return resultModes;
      }
    });
    if (resultModes.length == 0) {
      return ["notAvailable"];
    } else {
      return resultModes;
    }
  }
}

final Food apple = Food("Apfel", "img/apple.png",
    localSeason:              [n, n, n, n, n, n, s, f, f, f, f, n],
    localStorage:             [f, f, f, f, f, f, f, f, f, f, f, f]);

final Food apricot = Food("Aprikose", "img/apricot.png",
    localSeason:              [n, n, n, n, n, n, s, s, s, n, n, n],
    landTransportSeason:      [n, n, n, n, f, f, f, f, f, n, n, n],
    landTransportStorage:     [n, n, n, n, n, n, n, n, n, s, s, n],
    flightTransportAvailable: [s, s, s, s, s, s, s, s, s, s, s, s]);

final Food pear = Food("Birne", "img/pear.png",
    localSeason:              [n, n, n, n, n, n, n, f, f, f, f, s],
    localStorage:             [s, s, n, n, n, n, n, s, s, s, s, s],
    flightTransportAvailable: [s, s, s, s, s, s, s, s, s, s, s, s]);