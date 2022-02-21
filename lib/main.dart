import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:seasoncalendar/routes.dart';
import 'package:seasoncalendar/app_config.dart';
import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/l10n/localizationsDelegates/material_localization_eo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var configuredApp = Phoenix(
    child: FutureBuilder(
        future: appConfigFuture(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ChangeNotifierProvider(
                create: (_) => AppConfig.fromAsync(snapshot.data!),
                lazy: false,
                builder: (_, __) => const MyApp());
          } else {
            return const CircularProgressIndicator();
          }
        }),
  );

  return runApp(configuredApp);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localeListResolutionCallback: (deviceLocales, supportedLocales) {
        final newLocale =
            basicLocaleListResolution(deviceLocales, supportedLocales);
        // if null after localeLoadedFromPrefs use device locale
        if (AppConfig.of(context).locale == null) {
          AppConfig.of(context).changeLocale(newLocale);
          return newLocale;
        }
        return AppConfig.of(context).locale;
      },
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        final newLocale =
            basicLocaleListResolution([deviceLocale!], supportedLocales);
        if (AppConfig.of(context).locale == null) {
          AppConfig.of(context).changeLocale(newLocale);
          return newLocale;
        }
        return AppConfig.of(context).locale;
      },
      debugShowCheckedModeBanner: true,
      title: L10n.current.appTitle,
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
