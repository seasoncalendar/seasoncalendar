import 'dart:math';

import 'package:edit_distance/edit_distance.dart';

import 'package:flutter/material.dart';

import 'package:seasoncalendar/components/food_view.dart';
import 'package:seasoncalendar/models/food_display_configuration.dart';

const maxEditDist = 3;

class SearchScreen extends SearchDelegate<String> {
  final FoodDisplayConfiguration _fdc;
  
  SearchScreen(FoodDisplayConfiguration fdc, String searchFieldLabel)
      : _fdc = fdc,
        super(searchFieldLabel: searchFieldLabel);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
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
          close(context, "");
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    return getMatchingFoodView(context, _fdc);
  }

  Widget getMatchingFoodView(BuildContext context, FoodDisplayConfiguration fdc) {
    var query = this.query.trim(); //clean search input
    var allFoods = fdc.allFoods;

    // show full list on small query
    if (query.length < 3) {
      allFoods.sort((a, b) => a.displayName.compareTo(b.displayName));
      return FoodView.fromSearchResult(fdc, allFoods);
    }

    // show exact, starting and inner matches
    var exactMatches = allFoods
        .where((food) => food.synonyms
            .map((s) => s.toLowerCase())
            .contains(query.toLowerCase()))
        .toList();

    var startsWithMatches = allFoods
        .where((food) => food.synonyms.any(
            (synonym) => synonym.toLowerCase().startsWith(query.toLowerCase())))
        .toList();

    var innerMatches = allFoods
        .where((food) => food.synonyms.any((synonym) =>
            !synonym.toLowerCase().startsWith(query.toLowerCase()) &&
            synonym.toLowerCase().contains(query.toLowerCase())))
        .toList();

    var matches = exactMatches;

    var tmp = [...startsWithMatches, ...innerMatches];
    for (var food in tmp) {
      if (!matches.contains(food)) {
        matches.add(food);
      }
    }

    if (matches.isNotEmpty) {
      return FoodView.fromSearchResult(fdc, matches);
    }

    final Levenshtein lvs = Levenshtein();

    var lvsResults = allFoods
        .where((food) =>
            (food.synonyms.map((synonym) {
              return lvs.distance(synonym.toLowerCase(), query.toLowerCase()) /
                  synonym.length;
            })).reduce(min) <=
            0.5)
        .toList();

    return FoodView.fromSearchResult(fdc, lvsResults);
  }
}
