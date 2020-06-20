import 'package:shared_preferences/shared_preferences.dart';

class FavoriteFoods {

  List<String> foods = List<String>();
  SharedPreferences _prefs;

  void init() async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs != null) {
      final foodString = _prefs.getString("favoriteFoods");
      if (foods != null) {
        foods = foodString.split(", ");
        for (int i = 0; i < foods.length; ++i) {
          if (foods[i] == "") {
            foods.remove(foods[i]);
          }
        }
      }
    }
  }

  bool isFavoriteFood(String foodName) {
    return foods.contains(foodName);
  }

  List<String> getFavoriteFoods() {
    return foods;
  }

  void setFavoriteFoods(List<String> favoriteFoods) {
    foods = favoriteFoods;
    _prefs.setString("favoriteFoods", foods.join(", "));
  }

  void addFavoriteFood(String foodName) {
    if (foods.contains(foodName)) return;
    foods.add(foodName);
    foods.sort();
    _prefs.setString("favoriteFoods", foods.join(", "));
  }

  void removeFavoriteFood(String foodName) {
    if (!foods.contains(foodName)) return;
    foods.remove(foodName);
    _prefs.setString("favoriteFoods", foods.join(", "));
  }
}