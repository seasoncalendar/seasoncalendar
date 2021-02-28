import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:seasoncalendar/models/food_display_configuration.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/theme/seasoncalendar_icons.dart';
import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/screens/search/search_screen.dart';
import 'package:seasoncalendar/generated/l10n.dart';

class HomeScreenNavigationBar extends StatelessWidget {
  final FoodDisplayConfiguration _fdc;

  HomeScreenNavigationBar(FoodDisplayConfiguration fdc) : _fdc = fdc;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SettingsPageState.getSettings(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> settings = snapshot.data;
            return Container(
              color: defaultTheme.primaryColor,
              child: Row(
                children: <Widget>[
                  Spacer(flex: 2),
                  Expanded(
                    flex: 10,
                    child: IconButton(
                      icon: settings["showFruits"]
                          ? Icon(
                              SeasonCalendarIcons.apple_alt,
                              color: Colors.black,
                            )
                          : Icon(
                              SeasonCalendarIcons.apple_alt,
                              color: Colors.black26,
                            ),
                      onPressed: () {
                        _fdc.toggleFruitsSelected();
                      },
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: IconButton(
                      icon: settings["showVegetables"]
                          ? Icon(
                              SeasonCalendarIcons.carrot,
                              color: Colors.black,
                            )
                          : Icon(
                              SeasonCalendarIcons.carrot,
                              color: Colors.black26,
                            ),
                      onPressed: () {
                        _fdc.toggleVegetablesSelected();
                      },
                    ),
                  ),
                  Spacer(flex: 5),
                  Expanded(
                    flex: 10,
                    child: IconButton(
                      icon: Icon(_fdc.favoritesSelected
                          ? Icons.star
                          : Icons.star_border),
                      onPressed: () {
                        _fdc.toggleFavoritesSelected();
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
                              delegate: SearchScreen(_fdc.monthIndex,
                                  L10n.of(context).searchFieldLabel));
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
                    child: IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () => Navigator.of(context).pushNamed("/etc"),
                    ),
                  ),
                  Spacer(flex: 2)
                ],
              ),
            );
          } else {
            return LinearProgressIndicator();
          }
        });
  }

  void _showSettings(BuildContext context) {
    Navigator.of(context)
        .pushNamed("/settings")
        .then((_) => _fdc.updateFoodsAndNotify());
  }
}
