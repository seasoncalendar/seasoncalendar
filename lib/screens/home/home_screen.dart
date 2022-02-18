import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seasoncalendar/components/home_screen_navigation_bar.dart';
import 'package:seasoncalendar/components/month_selector.dart';
import 'package:seasoncalendar/models/food_display_configuration.dart';
import 'package:seasoncalendar/components/food_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<FoodDisplayConfiguration>(
          builder: (context, fdc, child) {
            return MonthSelector(fdc);
          },
        ),
      ),
      body: Consumer<FoodDisplayConfiguration>(
        builder: (context, fdc, child) {
          return FoodView(fdc);
        },
      ),
      bottomNavigationBar: Consumer<FoodDisplayConfiguration>(
        builder: (context, fdc, child) {
          return HomeScreenNavigationBar(fdc);
        },
      ),
    );
  }
}
