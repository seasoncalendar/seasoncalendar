import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'foods.dart';
import 'foodsview.dart';

class FoodSearch extends SearchDelegate<String> {

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
    final List<String> resultList = query.isEmpty ?
    allFoods : allFoods.where((s) => s.toLowerCase().startsWith(query.toLowerCase())).toList();
    return foodsInSeasonView(resultList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}