import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'food.dart';
import 'foodsview.dart';
import 'package:edit_distance/edit_distance.dart';

const maxEditDist = 3;

class FoodSearch extends SearchDelegate<String> {

  int _monthIndex;

  FoodSearch(int monthIndex) {
    _monthIndex = monthIndex;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () { query = "";}
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final Levenshtein lvs = new Levenshtein();
    final List<Food> resultList = query.isEmpty ?
    allFoods : allFoods.where((food) =>
      lvs.distance(food.name.toLowerCase(), query.toLowerCase()) <= maxEditDist).toList();
    return foodsView(resultList, _monthIndex);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}