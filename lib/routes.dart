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

final Map<String, WidgetBuilder> appRoutes = {
  "/": (context) => FutureBuilder(
      future: foodDisplayConfigurationFuture(),
      builder: (_, AsyncSnapshot<List<Object>> snapshot) {
        if (snapshot.hasData) {
          return ChangeNotifierProxyProvider<AppConfig, FoodDisplayConfiguration>(
            create: (_) => FoodDisplayConfiguration.async(AppConfig.of(context), snapshot.data!),
            update: (_, config, foodDC) {
              foodDC ??= FoodDisplayConfiguration.async(config, snapshot.data!);
              return foodDC..update(config);
            },
            child: const HomeScreen(),
          );
        } else {
          return const LoadingScaffold();
        }
      }),


  "/settings": (context) => SettingsPage(AppConfig.of(context).initialSettings),
  "/settings/region": (_) => const SettingsRegionPage(),
  "/settings/language": (_) => const SettingsLanguagePage(),
  "/etc": (_) => const EtcPage(),
  "/etc/howto": (_) => const HowToPage(),
  "/etc/about": (_) => const AboutPage(),
  "/etc/contrib": (_) => const ContribPage(),
  "/etc/support": (_) => const SupportPage(),
  "/etc/imprint": (_) => const ImprintPage(),
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
