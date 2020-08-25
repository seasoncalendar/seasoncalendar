import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isFavoriteFood(String foodName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> foods = prefs.getStringList("favoriteFoods");
  if (foods == null) {
    return false;
  } else {
    return foods.contains(foodName);
  }
}

Future<List<String>> getFavoriteFoods() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList("favoriteFoods") ?? List<String>();
}

void setFavoriteFoods(List<String> favoriteFoods) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("favoriteFoods", favoriteFoods);
}

void addFavoriteFood(String foodName) async {
  List<String> foods = await getFavoriteFoods();
  if (foods.contains(foodName)) return;
  foods.add(foodName);
  foods.sort();
  setFavoriteFoods(foods);
}

void removeFavoriteFood(String foodName) async {
  List<String> foods = await getFavoriteFoods();
  if (!foods.contains(foodName)) return;
  foods.remove(foodName);
  setFavoriteFoods(foods);
}
