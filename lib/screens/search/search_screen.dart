import 'dart:math';

import 'package:edit_distance/edit_distance.dart';

import 'package:flutter/cupertino.dart';
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
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: DBProvider.db.getFoods(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Food> _newestFoodCatalog = snapshot.data;
          return getMatchingFoodView(context, _newestFoodCatalog);
        } else {
          return LoadingWidget();
        }
      },
    );
  }

  Widget getMatchingFoodView(BuildContext context, List<Food> dbFoods) {
    List<Food> resultList = List<Food>();

    if (query.length < 3) {
      resultList = dbFoods;
      resultList.sort((a, b) => a.displayName.compareTo(b.displayName));
      return FoodView.fromSearchResult(resultList, _monthIndex);
    }

    var exactMatches = dbFoods
        .where((food) => food.synonyms
            .map((s) => s.toLowerCase())
            .contains(query.toLowerCase()))
        .toList();

    print(exactMatches.length);

    if (exactMatches.length > 0) {
      return FoodView.fromSearchResult(exactMatches, _monthIndex);
    }

    var startsWith = dbFoods
        .where((food) => food.synonyms.any((synonym) =>
            synonym.toLowerCase().startsWith(query.toLowerCase()) &&
            query.length >= 4))
        .toList();

    print(startsWith.length);

    if (startsWith.length > 0) {
      return FoodView.fromSearchResult(startsWith, _monthIndex);
    }

    final Levenshtein lvs = new Levenshtein();

    var lvsResults = dbFoods
        .where((food) =>
            (food.synonyms.map((synonym) {
              return lvs.distance(synonym.toLowerCase(), query.toLowerCase()) /
                  synonym.length;
            })).reduce(min) <=
            0.5)
        .toList();

    print(lvsResults.length);

    return FoodView.fromSearchResult(lvsResults, _monthIndex);
  }
}
