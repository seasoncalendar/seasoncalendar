import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seasoncalendar/components/favorite_foods.dart';
import 'package:seasoncalendar/components/loading_scaffold.dart';
import 'package:seasoncalendar/helpers/db_provider.dart';
import 'package:seasoncalendar/helpers/json_asset_loader.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/models/food_display_configuration.dart';
import 'package:seasoncalendar/screens/about/about_screen.dart';
import 'package:seasoncalendar/screens/contrib/contrib_screen.dart';
import 'package:seasoncalendar/screens/home/home_screen.dart';
import 'package:seasoncalendar/screens/imprint/imprint_screen.dart';
import 'package:seasoncalendar/screens/imprint/imgsources/imgsources_screen.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/screens/settings/filterfoods/settings_filterfoods_screen.dart';
import 'package:seasoncalendar/screens/support/support_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/": (_) => FutureBuilder(
      future: Future.wait([
        getFavoriteFoods(),
        SettingsPageState.getSettings(),
        loadAssetFromJson("assets/text/homepagetext.json"),
        DBProvider.db.getFoods(),
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final favoriteFoodNames = snapshot.data[0];
          final settings = snapshot.data[1];
          final homePageText = snapshot.data[2];
          final allFoods = snapshot.data[3];
          return ChangeNotifierProvider(
            create: (context) => FoodDisplayConfiguration(allFoods,
                homePageText['monthToString'], settings, favoriteFoodNames),
            child: HomeScreen(),
          );
        } else {
          return LoadingScaffold();
        }
      }),
  "/settings": (_) => FutureBuilder(
        future: Future.wait([
          loadAssetFromJson("assets/initialsettings.json"),
          loadAssetFromJson("assets/text/settingstext.json"),
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final initialSettings = snapshot.data[0];
            final settingsText = snapshot.data[1];
            return SettingsPage(initialSettings, settingsText);
          } else {
            return LoadingScaffold();
          }
        },
      ),
  "/settings/filter": (_) => FutureBuilder(
        future: Future.wait([
          loadAssetFromJson("assets/initialsettings.json"),
          loadAssetFromJson("assets/text/settingstext.json"),
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final initialSettings = snapshot.data[0];
            final settingsText = snapshot.data[1];
            return SettingsFilterSettingPage(initialSettings, settingsText);
          } else {
            return LoadingScaffold();
          }
        },
      ),
  "/about": (_) => FutureBuilder(
        future: loadAssetFromJson("assets/text/aboutpagetext.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final aboutPageText = snapshot.data;
            return AboutPage(aboutPageText);
          } else {
            return LoadingScaffold();
          }
        },
      ),
  "/contribute": (_) => FutureBuilder(
        future: Future.wait([
          loadAssetFromJson("assets/text/contribpagetext.json"),
          loadAssetFromJson("assets/text/links.json"),
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final contribPageText = snapshot.data[0];
            final links = snapshot.data[1];
            return ContribPage(contribPageText, links);
          } else {
            return LoadingScaffold();
          }
        },
      ),
  "/support": (_) => FutureBuilder(
        future: Future.wait([
          loadAssetFromJson("assets/text/supportpagetext.json"),
          loadAssetFromJson("assets/text/links.json"),
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final supportPageText = snapshot.data[0];
            final links = snapshot.data[1];
            return SupportPage(supportPageText, links);
          } else {
            return LoadingScaffold();
          }
        },
      ),
  "/imprint": (_) => FutureBuilder(
        future: loadAssetFromJson("assets/text/imprintpagetext.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final imprintPageText = snapshot.data;
            return ImprintPage(imprintPageText);
          } else {
            return LoadingScaffold();
          }
        },
      ),
  "/imprint/imgs": (_) => FutureBuilder(
        future: Future.wait([
          loadAssetFromJson("assets/text/imprintpagetext.json"),
          DBProvider.db.getFoods(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final imprintPageText = snapshot.data[0];
            final List<Food> allFoods = snapshot.data[1];
            return ImgSourcesScreen(allFoods, imprintPageText);
          } else {
            return LoadingScaffold();
          }
        },
      ),
};

const Map<String, String> etcPages = {
  "Erklärung": "/about",
  "App verbessern": "/contribute",
  "Unterstützen": "/support",
  "Impressum": "/imprint",
};
