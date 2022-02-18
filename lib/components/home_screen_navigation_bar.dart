import 'package:flutter/material.dart';

import 'package:seasoncalendar/models/food_display_configuration.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/theme/seasoncalendar_icons.dart';
import 'package:seasoncalendar/screens/search/search_screen.dart';
import 'package:seasoncalendar/generated/l10n.dart';

class HomeScreenNavigationBar extends StatelessWidget {
  final FoodDisplayConfiguration _fdc;

  const HomeScreenNavigationBar(FoodDisplayConfiguration fdc, {Key? key}) : _fdc = fdc, super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SettingsPageState.getSettings(),
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            var settings = snapshot.data!;
            return Container(
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                children: <Widget>[
                  const Spacer(flex: 2),
                  Expanded(
                    flex: 10,
                    child: IconButton(
                      icon: settings["showFruits"]
                          ? const Icon(
                              SeasonCalendarIcons.apple_alt,
                              color: Colors.black,
                            )
                          : const Icon(
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
                          ? const Icon(
                              SeasonCalendarIcons.carrot,
                              color: Colors.black,
                            )
                          : const Icon(
                              SeasonCalendarIcons.carrot,
                              color: Colors.black26,
                            ),
                      onPressed: () {
                        _fdc.toggleVegetablesSelected();
                      },
                    ),
                  ),
                  const Spacer(flex: 5),
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
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          showSearch(
                              context: context,
                              delegate: SearchScreen(_fdc.monthIndex,
                                  L10n.of(context).searchFieldLabel));
                        }),
                  ),
                  const Spacer(flex: 5),
                  Expanded(
                    flex: 10,
                    child: IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () => _showSettings(context)),
                  ),
                  Expanded(
                    flex: 10,
                    child: IconButton(
                      icon: const Icon(Icons.more_horiz),
                      onPressed: () => Navigator.of(context).pushNamed("/etc"),
                    ),
                  ),
                  const Spacer(flex: 2)
                ],
              ),
            );
          } else {
            return const LinearProgressIndicator();
          }
        });
  }

  void _showSettings(BuildContext context) {
    Navigator.of(context)
        .pushNamed("/settings")
        .then((_) => _fdc.updateFoodsAndNotify());
  }
}
