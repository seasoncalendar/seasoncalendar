import 'dart:math';

import 'package:edit_distance/edit_distance.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/components/food_view.dart';

const maxEditDist = 3;

class SearchScreen extends SearchDelegate<String> {
  final List<Food> _allFoods;
  final int _monthIndex;
  final List<dynamic> _monthNames;

  SearchScreen(List<Food> allFoods, int monthIndex, List<dynamic> monthNames,
      String searchFieldLabel)
      : _allFoods = allFoods,
        _monthIndex = monthIndex,
        _monthNames = monthNames,
        super(searchFieldLabel: searchFieldLabel);

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
    List<Food> resultList = List<Food>();

    if (query.isEmpty) {
      resultList = _allFoods;
      resultList.sort((a, b) => a.displayName.compareTo(b.displayName));
      return FoodView.fromSearchResult(resultList, _monthIndex, _monthNames);
    }

    var exactMatches = _allFoods
        .where((food) => food.synonyms
            .map((s) => s.toLowerCase())
            .contains(query.toLowerCase()))
        .toList();

    print("exactMatches.length:");
    print(exactMatches.length);

    if (exactMatches.length > 0) {
      return FoodView.fromSearchResult(exactMatches, _monthIndex, _monthNames);
    }

    var startsWith = _allFoods
        .where((food) => food.synonyms.any((synonym) =>
            synonym.toLowerCase().startsWith(query.toLowerCase()) &&
            query.length >= 4))
        .toList();

    print("startsWith.length:");
    print(startsWith.length);

    if (startsWith.length > 0) {
      return FoodView.fromSearchResult(startsWith, _monthIndex, _monthNames);
    }

    final Levenshtein lvs = new Levenshtein();

    var lvsResults = _allFoods
        .where((food) =>
            (food.synonyms.map((synonym) {
              return lvs.distance(synonym.toLowerCase(), query.toLowerCase()) /
                  synonym.length;
            })).reduce(min) <=
            0.5)
        .toList();

    print("LVSResults.length:");
    print(lvsResults.length);

    return FoodView.fromSearchResult(lvsResults, _monthIndex, _monthNames);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
