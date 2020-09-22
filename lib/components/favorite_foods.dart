import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isFavoriteFood(String foodId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> foods = prefs.getStringList("favoriteFoods");
  if (foods == null) {
    return false;
  } else {
    return foods.contains(foodId);
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

void addFavoriteFood(String foodId) async {
  List<String> foods = await getFavoriteFoods();
  if (foods.contains(foodId)) return;
  foods.add(foodId);
  foods.sort();
  setFavoriteFoods(foods);
}

void removeFavoriteFood(String foodId) async {
  List<String> foods = await getFavoriteFoods();
  if (!foods.contains(foodId)) return;
  foods.remove(foodId);
  setFavoriteFoods(foods);
}
