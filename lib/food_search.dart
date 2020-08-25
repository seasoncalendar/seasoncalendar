import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'food.dart';
import 'food_view.dart';
import 'package:edit_distance/edit_distance.dart';

const maxEditDist = 3;

class FoodSearch extends SearchDelegate<String> {
  List<Food> _allFoods;
  int _monthIndex;
  List<dynamic> _monthNames;

  FoodSearch(List<Food> allFoods, int monthIndex, List<dynamic> monthNames,
      String searchFieldLabel)
      : super(searchFieldLabel: searchFieldLabel) {
    _allFoods = allFoods;
    _monthIndex = monthIndex;
    _monthNames = monthNames;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final Levenshtein lvs = new Levenshtein();
    final List<Food> resultList = query.isEmpty
        ? _allFoods
        : _allFoods
            .where((food) =>
                lvs.distance(food.name.toLowerCase(), query.toLowerCase()) <=
                    maxEditDist ||
                food.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return foodsView(resultList, _monthIndex, _monthNames);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
