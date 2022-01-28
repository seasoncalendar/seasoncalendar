import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seasoncalendar/helpers/favorite_foods.dart';
import 'package:seasoncalendar/components/loading_scaffold.dart';
import 'package:seasoncalendar/helpers/db_provider.dart';
import 'package:seasoncalendar/helpers/json_asset_loader.dart';
import 'package:seasoncalendar/helpers/user_db_provider.dart';
import 'package:seasoncalendar/models/food_display_configuration.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/screens/etc/howto/howto_screen.dart';
import 'package:seasoncalendar/screens/home/home_screen.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/screens/settings/settings_language_screen.dart';
import 'package:seasoncalendar/screens/settings/settings_region_screen.dart';
import 'package:seasoncalendar/screens/etc/etc_screen.dart';
import 'package:seasoncalendar/screens/etc/about/about_screen.dart';
import 'package:seasoncalendar/screens/etc/contrib/contrib_screen.dart';
import 'package:seasoncalendar/screens/etc/imprint/imprint_screen.dart';
import 'package:seasoncalendar/screens/etc/imprint/imgsources/imgsources_screen.dart';
import 'package:seasoncalendar/screens/etc/support/support_screen.dart';

final initial_settings = loadAssetFromJson("assets/initialsettings.json");
final independent_text =
    loadAssetFromJson("assets/localization_independent_text.json");

final Map<String, WidgetBuilder> appRoutes = {
  "/": (context) => FutureBuilder(
      future: Future.wait([
        getFavoriteFoods(),
        SettingsPageState.getSettings(),
        DBProvider.db.getFoods(),
        // TODO when data[3] is used
        // UserDBProvider.db.getCustomFoods()
      ]),
      builder: (_, AsyncSnapshot<List<Object>> snapshot) {
        if (snapshot.hasData) {
          final favoriteFoodNames = snapshot.data![0] as List<String>;
          final settings = snapshot.data![1] as Map<String, dynamic>;
          final allFoods = snapshot.data![2] as List<Food>;
          // TODO Data[3] for custom foods
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
        future: initial_settings,
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            final initialSettings = snapshot.data!;
            return SettingsPage(initialSettings);
          } else {
            return LoadingScaffold();
          }
        },
      ),
  "/settings/region": (_) => FutureBuilder(
        future: initial_settings,
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            final initialSettings = snapshot.data!;
            return SettingsRegionPage(initialSettings);
          } else {
            return LoadingScaffold();
          }
        },
      ),
  "/settings/language": (_) => FutureBuilder(
        future: initial_settings,
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            final initialSettings = snapshot.data!;
            return SettingsLanguagePage(initialSettings);
          } else {
            return LoadingScaffold();
          }
        },
      ),
  "/etc": (_) => EtcPage(),
  "/etc/howto": (_) => HowToPage(),
  "/etc/about": (_) => AboutPage(),
  "/etc/contrib": (_) => FutureBuilder(
        future: independent_text,
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            final l10nIndependentText = snapshot.data!;
            return ContribPage(l10nIndependentText);
          } else {
            return LoadingScaffold();
          }
        },
      ),
  "/etc/support": (_) => FutureBuilder(
        future: independent_text,
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            final l10nIndependentText = snapshot.data!;
            return SupportPage(l10nIndependentText);
          } else {
            return LoadingScaffold();
          }
        },
      ),
  "/etc/imprint": (_) => FutureBuilder(
        future: independent_text,
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            final l10nIndependentText = snapshot.data!;
            return ImprintPage(l10nIndependentText);
          } else {
            return LoadingScaffold();
          }
        },
      ),
  "/etc/imprint/imgs": (context) => FutureBuilder(
        future: DBProvider.db.getFoods(),
        builder: (context, AsyncSnapshot<Iterable<Food>> snapshot) {
          if (snapshot.hasData) {
            final allFoods = List<Food>.from(snapshot.data!);
            return ImgSourcesScreen(allFoods);
          } else {
            return LoadingScaffold();
          }
        },
      ),
};
