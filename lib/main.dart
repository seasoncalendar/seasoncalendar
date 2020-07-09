import 'dart:convert';
import 'package:flutter/material.dart';
import 'routes.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/text/apptext.json"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final mainText = json.decode(snapshot.data);
          return getMaterialApp(context, mainText["appTitle"]);
        } else {
          return getMaterialApp(context, "Season Calendar");
        }
      }
    );
  }

  Widget getMaterialApp(BuildContext context, String appTitle) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: appTitle,
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}