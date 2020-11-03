import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:seasoncalendar/routes.dart';
import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/generated/l10n.dart';

void main() async {
  runApp(
    Phoenix(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    MyAppState state = context.findAncestorStateOfType<MyAppState>();

    state.setState(() {
      state.locale = newLocale;
    });
  }
}

class MyAppState extends State<MyApp> {
  Locale locale;
  bool localeLoaded = false;

  @override
  void initState() {
    super.initState();
    this._fetchLocale().then((locale) {
      setState(() {
        this.localeLoaded = true;
        this.locale = locale;
      });
    });
  }

  _fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    if (prefs.getString('languageCode') == null ||
        prefs.getString('languageCode') == "null") {
      return null;
    }

    return Locale(prefs.getString('languageCode'));
  }

  @override
  Widget build(BuildContext context) {
    if (this.localeLoaded == false) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(defaultTheme.accentColor),
      );
    } else {
      return MaterialApp(
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          if (this.locale == null) {
            if (supportedLocales
                .map((l) => l.languageCode)
                .contains(deviceLocale.languageCode)) {
              this.locale = deviceLocale;
            } else {
              this.locale = Locale('en');
            }
          }
          return this.locale;
        },
        debugShowCheckedModeBanner: true,
        title: "seasoncalendar",
        initialRoute: '/',
        routes: appRoutes,
        theme: defaultTheme,
        darkTheme: defaultTheme,
        localizationsDelegates: [
          L10n.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.delegate.supportedLocales,
      );
    }
  }
}
