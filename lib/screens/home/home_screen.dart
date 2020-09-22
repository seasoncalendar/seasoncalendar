import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:seasoncalendar/components/home_screen_navigation_bar.dart';
import 'package:seasoncalendar/components/month_selector.dart';
import 'package:seasoncalendar/components/food_display_configuration.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/components/food_view.dart';

class HomeScreen extends StatelessWidget {
  final FoodDisplayConfiguration _fdc;
  final GlobalKey<FoodDisplayConfigurationState> foodStateKey;

  HomeScreen(
    List<String> favoriteFoodNames,
    Map<String, dynamic> settings,
    Map<String, dynamic> homescreenText,
    List<Food> allFoods,
  )   : _fdc = FoodDisplayConfiguration(allFoods, homescreenText['monthToString'], settings, favoriteFoodNames),
        foodStateKey = GlobalKey<FoodDisplayConfigurationState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: MonthSelector(foodStateKey)),
      body: FoodView.fromGlobalKey(foodStateKey),
      bottomNavigationBar: HomeScreenNavigationBar(foodStateKey),
    );
  }
}