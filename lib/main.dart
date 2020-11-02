import 'package:flutter/material.dart';
import 'package:seasoncalendar/components/loading_scaffold.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seasoncalendar/routes.dart';
import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/l10n/app_localizations.dart';

void main() async {
  runApp(MyApp());
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
    print("FSLKDJFLKDSJFLKS");
    print(this.locale);
  }

  _fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    if (prefs.getString('languageCode') == null ||
        prefs.getString('languageCode') == "null") {
      print("language code is not valid");
      return null;
    }

    return Locale(
        prefs.getString('languageCode'));
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
            print("set locale is null");
            print(deviceLocale.languageCode);
            if (supportedLocales.map((l) => l.languageCode).contains(deviceLocale.languageCode)) {
              this.locale = deviceLocale;
            } else {
              this.locale = Locale('en');
            }
          }
          print(this.locale);
          return this.locale;
        },
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
}
