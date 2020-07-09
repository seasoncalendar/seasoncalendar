import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'settings.dart';
import 'food.dart';
import 'favoritefoods.dart';
import 'etcpages/aboutpage.dart';
import 'etcpages/contribpage.dart';
import 'etcpages/supportpage.dart';
import 'etcpages/imprintpage.dart';
import 'helpers/jsonassetloader.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/": (_) => FutureBuilder(
      future: Future.wait([
        getFavoriteFoods(),
        SettingsPageState.getSettings(),
        loadAssetFromJson("assets/text/homepagetext.json"),
        loadAssetFromJson("assets/foods.json")
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final favoriteFoodNames = snapshot.data[0];
          final settings = snapshot.data[1];
          final homePageText = snapshot.data[2];
          final allFoods = getFoodsFromJson(snapshot.data[3]);
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
};

const Map<String, String> etcPages = {
  "Über die App": "/about",
  "App verbessern": "/contribute",
  "Unterstützen": "/support",
};
