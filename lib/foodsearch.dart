import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'food.dart';
import 'foodsview.dart';

class FoodSearch extends SearchDelegate<String> {

  int _month;

  FoodSearch(int month) {
    _month = month;
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
    final List<Food> resultList = query.isEmpty ?
    allFoods : allFoods.where((food) =>
        food.name.toLowerCase().startsWith(query.toLowerCase())).toList();
    return foodsView(resultList, _month);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}