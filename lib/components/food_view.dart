import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/components/food_display_configuration.dart';
import 'package:seasoncalendar/components/food_tile.dart';

class FoodView extends StatelessWidget {

  final List<Food> _preparedFoods;
  final int _monthIndex;
  final List<dynamic> _monthNames;

  FoodView.fromGlobalKey(GlobalKey<FoodDisplayConfigurationState> foodStateKey)
      : _preparedFoods = foodStateKey.currentState.foodsToDisplay,
        _monthIndex = foodStateKey.currentState.monthIndex,
        _monthNames = foodStateKey.currentState.widget.monthNames;

  FoodView(List<Food> preparedFoods, int monthIndex, List<dynamic> monthNames)
     : _preparedFoods = preparedFoods, _monthIndex = monthIndex, _monthNames = monthNames;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _preparedFoods.length,
      padding: const EdgeInsets.all(5.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
      ),
      itemBuilder: (context, i) {
        return FoodTile(_preparedFoods[i], _monthIndex, _monthNames);
      },
    );
  }
}