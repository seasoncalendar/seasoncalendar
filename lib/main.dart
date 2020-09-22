import 'package:flutter/material.dart';

import 'package:seasoncalendar/routes.dart';
import 'package:seasoncalendar/helpers/json_asset_loader.dart';
import 'package:seasoncalendar/theme/themes.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadAssetFromJson("assets/text/apptext.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final mainText = snapshot.data;
            return getMaterialApp(context, mainText["appTitle"]);
          } else {
            return getMaterialApp(context, "NAME NOT FOUND");
          }
        });
  }

  Widget getMaterialApp(BuildContext context, String appTitle) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: appTitle,
      initialRoute: '/',
      routes: appRoutes,
      theme: defaultTheme,
      darkTheme: defaultTheme,
    );
  }
}
