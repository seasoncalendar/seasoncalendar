import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/models/food_display_configuration.dart';
import 'package:seasoncalendar/components/food_tile.dart';

class FoodView extends StatelessWidget {
  final List<Food> _foodsToDisplay;
  final int _monthIndex;
  final List<dynamic> _monthNames;

  FoodView(FoodDisplayConfiguration fdc)
      : _foodsToDisplay = fdc.foodsToDisplay,
        _monthIndex = fdc.monthIndex,
        _monthNames = fdc.monthNames;

  FoodView.fromSearchResult(
      List<Food> searchResultFoods, int monthIndex, List<dynamic> monthNames)
      : _foodsToDisplay = searchResultFoods,
        _monthIndex = monthIndex,
        _monthNames = monthNames;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _foodsToDisplay.length,
      padding: const EdgeInsets.all(5.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
      ),
      itemBuilder: (context, i) {
        return FoodTile(_foodsToDisplay[i], _monthIndex, _monthNames);
      },
    );
  }
}
