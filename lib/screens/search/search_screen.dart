import 'dart:math';

import 'package:edit_distance/edit_distance.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/components/food_view.dart';
import 'package:seasoncalendar/models/food_display_configuration.dart';

const maxEditDist = 3;

class SearchScreen extends SearchDelegate<String> {
  List<Food> _allFoods;

  SearchScreen(List<Food> allFoods, String searchFieldLabel)
      : super(searchFieldLabel: searchFieldLabel) {
    _allFoods = allFoods;
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
    List<Food> resultList = List<Food>();

    if (query.isEmpty) {
      resultList = _allFoods;
      resultList.sort((a, b) => a.displayName.compareTo(b.displayName));
      return Consumer<FoodDisplayConfiguration>(
        builder: (context, fdc, child) {
          return FoodView.fromSearchResult(fdc, resultList);
        },
      );
    }

    var exactMatches = _allFoods
        .where((food) => food.synonyms
            .map((s) => s.toLowerCase())
            .contains(query.toLowerCase()))
        .toList();

    print("exactMatches.length:");
    print(exactMatches.length);

    if (exactMatches.length > 0) {
      return Consumer<FoodDisplayConfiguration>(
        builder: (context, fdc, child) {
          return FoodView.fromSearchResult(fdc, exactMatches);
        },
      );
    }

    var startsWith = _allFoods
        .where((food) => food.synonyms.any((synonym) =>
            synonym.toLowerCase().startsWith(query.toLowerCase()) &&
            query.length >= 4))
        .toList();

    print("startsWith.length:");
    print(startsWith.length);

    if (startsWith.length > 0) {
      return Consumer<FoodDisplayConfiguration>(
        builder: (context, fdc, child) {
          return FoodView.fromSearchResult(fdc, startsWith);
        },
      );
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

    return Consumer<FoodDisplayConfiguration>(
      builder: (context, fdc, child) {
        return FoodView.fromSearchResult(fdc, lvsResults);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
