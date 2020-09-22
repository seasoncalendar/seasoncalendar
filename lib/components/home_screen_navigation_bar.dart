import 'package:flutter/material.dart';

import 'package:seasoncalendar/components/food_display_configuration.dart';
import 'package:seasoncalendar/theme/seasoncalendar_icons.dart';
import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/screens/search/search_screen.dart';
import 'package:seasoncalendar/routes.dart';

class HomeScreenNavigationBar extends StatelessWidget {
  final GlobalKey<FoodDisplayConfigurationState> _foodStateKey;

  HomeScreenNavigationBar(GlobalKey<FoodDisplayConfigurationState> foodStateKey)
      : _foodStateKey = foodStateKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: defaultTheme.primaryColor,
      child: Row(
        children: <Widget>[
          Spacer(flex: 2),
          Expanded(
            flex: 10,
            child: IconButton(
              icon: _foodStateKey.currentState.fruitsSelected
                  ? Icon(
                      SeasonCalendarIcons.apple_alt,
                      color: Colors.black,
                    )
                  : Icon(
                      SeasonCalendarIcons.apple_alt,
                      color: Colors.black26,
                    ),
              onPressed: () {
                _foodStateKey.currentState.toggleFruitsSelected();
              },
            ),
          ),
          Expanded(
            flex: 10,
            child: IconButton(
              icon: _foodStateKey.currentState.nonFruitsSelected
                  ? Icon(
                      SeasonCalendarIcons.carrot,
                      color: Colors.black,
                    )
                  : Icon(
                      SeasonCalendarIcons.carrot,
                      color: Colors.black26,
                    ),
              onPressed: () {
                _foodStateKey.currentState.toggleNonFruitsSelected();
              },
            ),
          ),
          Spacer(flex: 5),
          Expanded(
            flex: 10,
            child: IconButton(
              icon: Icon(_foodStateKey.currentState.favoritesSelected
                  ? Icons.star
                  : Icons.star_border),
              onPressed: () {
                _foodStateKey.currentState.toggleFavoritesSelected();
              },
            ),
          ),
          Expanded(
            flex: 10,
            child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: SearchScreen(
                          _foodStateKey.currentState.widget.allFoods,
                          _foodStateKey.currentState.monthIndex,
                          _foodStateKey.currentState.widget.monthNames,
                          "Suche..."));
                }),
          ),
          Spacer(flex: 5),
          Expanded(
            flex: 10,
            child: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => _showSettings(context)),
          ),
          Expanded(
            flex: 10,
            child: PopupMenuButton(
              icon: Icon(Icons.help),
              offset: Offset(0, -205),
              onSelected: (page) => _chooseEtcPage(page, context),
              itemBuilder: (context) {
                return etcPages.keys.map((String page) {
                  return PopupMenuItem<String>(value: page, child: Text(page));
                }).toList();
              },
            ),
          ),
          Spacer(flex: 2)
        ],
      ),
    );
  }

  void _showSettings(BuildContext context) {
    Navigator.of(context)
        .pushNamed("/settings")
        .then((_) => _foodStateKey.currentState.filterAndSortFoodsAsync());
  }

  void _chooseEtcPage(String pageRoute, BuildContext context) {
    Navigator.of(context).pushNamed(etcPages[pageRoute]);
  }
}
