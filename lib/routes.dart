import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seasoncalendar/app_config.dart';

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

Future<List<Object>> mainFuture() async {
  var origFoods = await DBProvider.db.getFoods();
  var customFoods = await UserDBProvider.db.getFoodsWithCustom(origFoods: origFoods);
  var favFoodNames = await getFavoriteFoods();
  return [origFoods, customFoods, favFoodNames];
}

final Map<String, WidgetBuilder> appRoutes = {
  "/": (context) => FutureBuilder(
      future: mainFuture(),
      builder: (_, AsyncSnapshot<List<Object>> snapshot) {
        if (snapshot.hasData) {
          List<Food> allFoods;
          if (AppConfig.of(context).useCustomAv) {
            // use foods merged with custom entries
            allFoods = snapshot.data![1] as List<Food>;
          } else {
            // use default food entries
            allFoods = snapshot.data![0] as List<Food>;
          }
          final favoriteFoodNames = snapshot.data![2] as List<String>;
          return ChangeNotifierProvider(
            create: (_) =>
                FoodDisplayConfiguration(allFoods, AppConfig.of(context).settings, favoriteFoodNames),
            child: const HomeScreen(),
          );
        } else {
          return const LoadingScaffold();
        }
      }),
  "/settings": (_) => FutureBuilder(
        future: initial_settings,
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            final initialSettings = snapshot.data!;
            return SettingsPage(initialSettings);
          } else {
            return const LoadingScaffold();
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
            return const LoadingScaffold();
          }
        },
      ),
  "/settings/language": (_) => SettingsLanguagePage(),
  "/etc": (_) => const EtcPage(),
  "/etc/howto": (_) => const HowToPage(),
  "/etc/about": (_) => const AboutPage(),
  "/etc/contrib": (_) => FutureBuilder(
        future: independent_text,
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            final l10nIndependentText = snapshot.data!;
            return ContribPage(l10nIndependentText);
          } else {
            return const LoadingScaffold();
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
            return const LoadingScaffold();
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
            return const LoadingScaffold();
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
            return const LoadingScaffold();
          }
        },
      ),
};
