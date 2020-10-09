import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seasoncalendar/components/favorite_foods.dart';
import 'package:seasoncalendar/components/loading_scaffold.dart';
import 'package:seasoncalendar/helpers/db_provider.dart';
import 'package:seasoncalendar/helpers/json_asset_loader.dart';
import 'package:seasoncalendar/models/food_display_configuration.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/screens/home/home_screen.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/screens/settings/filterfoods/settings_filterfoods_screen.dart';
import 'package:seasoncalendar/screens/etc/etc_screen.dart';
import 'package:seasoncalendar/screens/etc/about/about_screen.dart';
import 'package:seasoncalendar/screens/etc/contrib/contrib_screen.dart';
import 'package:seasoncalendar/screens/etc/imprint/imprint_screen.dart';
import 'package:seasoncalendar/screens/etc/imprint/imgsources/imgsources_screen.dart';
import 'package:seasoncalendar/screens/etc/support/support_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/": (context) => FutureBuilder(
      future: Future.wait([
        getFavoriteFoods(),
        SettingsPageState.getSettings(),
        DBProvider.db.getFoods(context),
      ]),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final favoriteFoodNames = snapshot.data[0];
          final settings = snapshot.data[1];
          final allFoods = snapshot.data[2];
          return ChangeNotifierProvider(
            create: (_) =>
                FoodDisplayConfiguration(allFoods, settings, favoriteFoodNames),
            child: HomeScreen(),
          );
        } else {
          return LoadingScaffold();
        }
      }),
  "/settings": (_) => FutureBuilder(
        future: loadAssetFromJson("assets/initialsettings.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final initialSettings = snapshot.data;
            return SettingsPage(initialSettings);
          } else {
            return LoadingScaffold();
          }
        },
      ),
  "/settings/filter": (_) => FutureBuilder(
        future: loadAssetFromJson("assets/initialsettings.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final initialSettings = snapshot.data;
            return SettingsFilterSettingPage(initialSettings);
          } else {
            return LoadingScaffold();
          }
        },
      ),
  "/etc": (_) => EtcPage(),
  "/etc/about": (_) => AboutPage(),
  "/etc/contrib": (_) => ContribPage(),
  "/etc/support": (_) => SupportPage(),
  "/etc/imprint": (_) => ImprintPage(),
  "/etc/imprint/imgs": (context) => FutureBuilder(
        future: DBProvider.db.getFoods(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Food> allFoods = snapshot.data;
            return ImgSourcesScreen(allFoods);
          } else {
            return LoadingScaffold();
          }
        },
      ),
};