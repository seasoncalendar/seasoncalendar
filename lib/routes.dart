import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/etcpages/imprint_imgs_page.dart';

import 'homepage.dart';
import 'settings.dart';
import 'settings_filter_setting.dart';
import 'models/food.dart';
import 'favorite_foods.dart';
import 'etcpages/about_page.dart';
import 'etcpages/contrib_page.dart';
import 'etcpages/support_page.dart';
import 'etcpages/imprint_page.dart';
import 'helpers/json_asset_loader.dart';
import 'helpers/db_provider.dart';

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
          return HomePage(favoriteFoodNames, settings, homePageText, allFoods);
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text("..."),
            ),
          );
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
            return Scaffold(
              appBar: AppBar(
                title: Text("..."),
              ),
            );
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
            return Scaffold(
              appBar: AppBar(
                title: Text("..."),
              ),
            );
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
            return Scaffold(
              appBar: AppBar(
                title: Text("..."),
              ),
            );
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
            return Scaffold(
              appBar: AppBar(
                title: Text("..."),
              ),
            );
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
            return Scaffold(
              appBar: AppBar(
                title: Text("..."),
              ),
            );
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
            return Scaffold(
              appBar: AppBar(
                title: Text("..."),
              ),
            );
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
        final allFoods = snapshot.data[1];
        return ImprintImgsPage(allFoods, imprintPageText);
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text("..."),
          ),
        );
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
