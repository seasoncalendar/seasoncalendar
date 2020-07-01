import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/food.dart';
import 'package:seasoncalendar/helpers/styles.dart';

import 'homepage.dart';
import 'settings.dart';
import 'favoritefoods.dart';
import 'etcpages/aboutpage.dart';
import 'etcpages/contributepage.dart';
import 'etcpages/supportpage.dart';
import 'etcpages/imprintpage.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/": (_) => FutureBuilder(
    future: Future.wait([getFavoriteFoods(), SettingsPageState.getSettings()]),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return HomePage(snapshot.data[0], snapshot.data[1]);
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text("ernte Lebensmittel..."),
          ),
        );
      }
    }),
  "/settings": (_) => SettingsPage(),
  "/about": (_) => AboutPage(),
  "/contribute": (_) => ContributePage(),
  "/support": (_) => SupportPage(),
  "/imprint": (_) => ImprintPage(),
};