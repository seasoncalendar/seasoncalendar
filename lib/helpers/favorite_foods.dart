import 'dart:async';

import 'package:seasoncalendar/models/food.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isFavoriteFood(Food food) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? foods = prefs.getStringList("favoriteFoods");
  if (foods == null) {
    return false;
  } else {
    return foods.contains(food.id);
  }
}

Future<List<String>> getFavoriteFoods() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList("favoriteFoods") ?? List<String>.empty(growable: true);
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
