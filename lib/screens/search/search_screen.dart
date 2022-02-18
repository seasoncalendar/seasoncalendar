import 'dart:math';

import 'package:edit_distance/edit_distance.dart';

import 'package:flutter/material.dart';
import 'package:seasoncalendar/components/loading_scaffold.dart';
import 'package:seasoncalendar/helpers/db_provider.dart';

import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/components/food_view.dart';

const maxEditDist = 3;

class SearchScreen extends SearchDelegate<String> {
  final int _monthIndex;

  SearchScreen(int monthIndex, String searchFieldLabel)
      : _monthIndex = monthIndex,
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
    return FutureBuilder(
      future: DBProvider.db.getFoods(),
      builder: (context, AsyncSnapshot<Iterable<Food>> snapshot) {
        if (snapshot.hasData) {
          List<Food> _newestFoodCatalog = List.from(snapshot.data!);
          return getMatchingFoodView(context, _newestFoodCatalog);
        } else {
          return const LoadingWidget();
        }
      },
    );
  }

  Widget getMatchingFoodView(BuildContext context, List<Food> dbFoods) {
    var query = this.query.trim(); //clean search input

    // show full list on small query
    if (query.length < 3) {
      dbFoods.sort((a, b) => a.displayName.compareTo(b.displayName));
      return FoodView.fromSearchResult(dbFoods, _monthIndex);
    }

    // show exact, starting and inner matches
    var exactMatches = dbFoods
        .where((food) => food.synonyms
            .map((s) => s.toLowerCase())
            .contains(query.toLowerCase()))
        .toList();

    var startsWithMatches = dbFoods
        .where((food) => food.synonyms.any(
            (synonym) => synonym.toLowerCase().startsWith(query.toLowerCase())))
        .toList();

    var innerMatches = dbFoods
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
      return FoodView.fromSearchResult(matches, _monthIndex);
    }

    final Levenshtein lvs = Levenshtein();

    var lvsResults = dbFoods
        .where((food) =>
            (food.synonyms.map((synonym) {
              return lvs.distance(synonym.toLowerCase(), query.toLowerCase()) /
                  synonym.length;
            })).reduce(min) <=
            0.5)
        .toList();

    return FoodView.fromSearchResult(lvsResults, _monthIndex);
  }
}
