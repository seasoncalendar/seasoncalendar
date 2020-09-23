import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/models/food_display_configuration.dart';
import 'package:seasoncalendar/components/food_tile.dart';

class FoodView extends StatelessWidget {
  final FoodDisplayConfiguration _fdc;
  final bool _fromSearchResult;
  final List<Food> _searchResultFoods;

  FoodView(FoodDisplayConfiguration fdc)
      : _fdc = fdc,
        _fromSearchResult = false,
        _searchResultFoods = List<Food>();

  FoodView.fromSearchResult(
      FoodDisplayConfiguration fdc, List<Food> searchResultFoods)
      : _fdc = fdc,
        _fromSearchResult = true,
        _searchResultFoods = searchResultFoods;

  @override
  Widget build(BuildContext context) {
    List<Food> preparedFoods;

    if (_fromSearchResult) {
      preparedFoods = _searchResultFoods;
    } else {
      preparedFoods = _fdc.foodsToDisplay;
    }

    int monthIndex = _fdc.monthIndex;
    List<dynamic> monthNames = _fdc.monthNames;

    return GridView.builder(
      itemCount: preparedFoods.length,
      padding: const EdgeInsets.all(5.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
      ),
      itemBuilder: (context, i) {
        return FoodTile(preparedFoods[i], monthIndex, monthNames);
      },
    );
  }
}
