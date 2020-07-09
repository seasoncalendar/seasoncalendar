import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:seasoncalendar/food.dart';
import 'package:seasoncalendar/helpers/styles.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'homepage.dart';
import 'settings.dart';
import 'favoritefoods.dart';
import 'etcpages/aboutpage.dart';
import 'etcpages/contribpage.dart';
import 'etcpages/supportpage.dart';
import 'etcpages/imprintpage.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/": (_) => FutureBuilder(
    future: Future.wait([
      getFavoriteFoods(),
      SettingsPageState.getSettings(),
      rootBundle.loadString("assets/text/homepagetext.json"),
      rootBundle.loadString("assets/foods.json")
      ]
    ),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final favoriteFoodNames = snapshot.data[0];
        final settings = snapshot.data[1];
        final homePageText = json.decode(snapshot.data[2]);
        final allFoods = getFoodsFromJson(json.decode(snapshot.data[3]));
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
    future: rootBundle.loadString("assets/initialsettings.json"),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final initialSettings = json.decode(snapshot.data);
        return SettingsPage(initialSettings);
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
    future: rootBundle.loadString("assets/text/aboutpagetext.json"),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final aboutPageText = json.decode(snapshot.data);
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
      rootBundle.loadString("assets/text/contribpagetext.json"),
      rootBundle.loadString("assets/text/links.json"),
    ]),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final contribPageText = json.decode(snapshot.data[0]);
        final links = json.decode(snapshot.data[1]);
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
      rootBundle.loadString("assets/text/supportpagetext.json"),
      rootBundle.loadString("assets/text/links.json"),
    ]),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final supportPageText = json.decode(snapshot.data[0]);
        final links = json.decode(snapshot.data[1]);
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
    future: rootBundle.loadString("assets/text/imprintpagetext.json"),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final imprintPageText = json.decode(snapshot.data);
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