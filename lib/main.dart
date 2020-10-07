import 'package:flutter/material.dart';

import 'package:seasoncalendar/routes.dart';
import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/l10n/app_localizations.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "seasoncalendar",
      initialRoute: '/',
      routes: appRoutes,
      theme: defaultTheme,
      darkTheme: defaultTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
