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
      .then((String? flavor) {
    inferredFlavor = appFlavorFromString(flavor!);
  }).catchError((error) {
    print('Failed to load flavor, defaulting to googleplay flavor!');
  });

  var configuredApp = Phoenix(
    child: AppConfig(child: const MyApp(), buildFlavor: inferredFlavor),
  );
  return runApp(configuredApp);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    MyAppState state = context.findAncestorStateOfType<MyAppState>()!;

    state.setState(() {
      state.locale = newLocale;
      Intl.defaultLocale = state.locale?.languageCode;
      L10n.load(state.locale!);
    });
  }
}

class MyAppState extends State<MyApp> {
  Locale? locale;
  bool localeLoadedFromPrefs = false;

  @override
  void initState() {
    super.initState();
    L10n.load(const Locale("en"));
    _fetchLocale().then((locale) {
      setState(() {
        localeLoadedFromPrefs = true;
        this.locale = locale;
      });
    });
  }

  _fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    var languageCode = prefs.getString('languageCode');

    if (languageCode == null || languageCode == "null") {
      return null;
    }
    return Locale(languageCode);
  }

  @override
  Widget build(BuildContext context) {
    if (this.localeLoadedFromPrefs == false) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).colorScheme.secondary),
      );
    } else {
      return MaterialApp(
        localeListResolutionCallback: (deviceLocales, supportedLocales) {
          final newLocale = basicLocaleListResolution(deviceLocales, supportedLocales);
          // if null after localeLoadedFromPrefs use device locale
          locale ??= newLocale;
          return locale;
        },
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          final newLocale = basicLocaleListResolution([deviceLocale!], supportedLocales);
          locale ??= newLocale;
          return locale;
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
