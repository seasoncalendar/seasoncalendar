import 'dart:ffi';

import 'package:provider/provider.dart';
import 'package:seasoncalendar/components/loading_scaffold.dart';
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
  String flavorStr = "";
  WidgetsFlutterBinding.ensureInitialized();

  await const MethodChannel('flavor')
      .invokeMethod<String>('getFlavor')
      .then((String? flavor) {
    flavorStr = flavor ?? "error";
  }).catchError((error) {
    print('Failed to load flavor, defaulting to googleplay flavor!');
  });

  var configuredApp = Phoenix(
    child: FutureBuilder(
        future: settingsConfigurationFuture,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ChangeNotifierProvider(
                create: (_) => AppConfig.fromAsync(flavorStr, snapshot.data!),
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
        var prefLocale = AppConfig.of(context).locale;
        AppConfig.of(context).locale ??= newLocale;
        return AppConfig.of(context).locale;
      },
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        final newLocale =
            basicLocaleListResolution([deviceLocale!], supportedLocales);
        AppConfig.of(context).locale ??= newLocale;
        return AppConfig.of(context).locale;
      },
      debugShowCheckedModeBanner: true,
      title: "Seasoncalendar",
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
