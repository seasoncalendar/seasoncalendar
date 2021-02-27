import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:seasoncalendar/routes.dart';
import 'package:seasoncalendar/app_config.dart';
import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:intl/intl.dart';
import 'package:seasoncalendar/l10n/localizationsDelegates/material_localization_eo.dart';

void main() async {
  var inferredFlavor = AppFlavor.googleplay;
  WidgetsFlutterBinding.ensureInitialized();

  await const MethodChannel('flavor')
      .invokeMethod<String>('getFlavor')
      .then((String flavor) {
        inferredFlavor = appFlavorFromString(flavor);
      })
      .catchError((error) {
    print('Failed to load flavor, defaulting to googleplay flavor!');
  });

  var configuredApp = Phoenix(
    child: AppConfig(child: MyApp(), buildFlavor: inferredFlavor),
  );
  return runApp(configuredApp);
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    MyAppState state = context.findAncestorStateOfType<MyAppState>();

    state.setState(() {
      state.locale = newLocale;
      Intl.defaultLocale = state.locale.languageCode;
      L10n.load(state.locale);
    });
  }
}

class MyAppState extends State<MyApp> {
  Locale locale;
  bool localeLoaded = false;

  @override
  void initState() {
    super.initState();
    L10n.load(Locale("en"));
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
          MaterialLocalizationEoDelegate(),
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.delegate.supportedLocales,
      );
    }
  }
}
