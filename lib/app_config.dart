import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/json_asset_loader.dart';
import 'generated/l10n.dart';
import 'helpers/lang_helper.dart';

enum AppFlavor { googleplay, foss }

AppFlavor appFlavorFromString(String flavorStr) {
  switch(flavorStr) {
    case 'foss':
      return AppFlavor.foss;
    case 'googleplay':
    default:
      return AppFlavor.googleplay;
  }
}

String versionCodeSuffixFromAppFlavor(AppFlavor flavor) {
  switch(flavor) {
    case AppFlavor.googleplay:
      return " (g)";
    case AppFlavor.foss:
      return " (f)";
  }
}

final settingsConfigurationFuture = Future.wait([
  SharedPreferences.getInstance(),
  loadAssetFromJson("assets/initialsettings.json"),
  loadAssetFromJson("assets/localization_independent_text.json"),
]);

class AppConfig extends ChangeNotifier {
  final AppFlavor flavor;
  late final SharedPreferences prefs;
  late final Map<String, dynamic> initialSettings;
  late final Map<String, dynamic> independentText;
  Map<String, dynamic> settings = {};
  Locale? locale;

  AppConfig.fromAsync(String flavorStr, AsyncSnapshot<dynamic> snapshot)
  : flavor = appFlavorFromString(flavorStr) {
    prefs = snapshot.data![0];
    initialSettings = snapshot.data[1];
    independentText = snapshot.data[2];
    for (var key in initialSettings.keys) {
      settings[key] = prefs.get(key) ?? initialSettings[key];
    }

    String? languageCode = prefs.getString('languageCode');
    if (languageCode == null || languageCode == "null") {
      locale = null;
    } else {
      locale = Locale(languageCode);
    }
  }

  AppConfig(this.flavor, this.settings, this.initialSettings) {
    for (var key in initialSettings.keys) {
      settings[key] = prefs.get(key) ?? initialSettings[key];
    }
  }

  static AppConfig of(BuildContext context, {bool listen = true}) {
    return Provider.of<AppConfig>(context, listen: listen);
  }

  static Future<Map<String, dynamic>> getSettingsI(
      Map<String, dynamic> initialSettings) async {
    Map<String, dynamic> settings = {};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var key in initialSettings.keys) {
      settings[key] = prefs.get(key) ?? initialSettings[key];
    }
    return settings;
  }

  void changeLocale(Locale newLocale, {bool notify = true}) {
    locale = newLocale;
    Intl.defaultLocale = newLocale.languageCode;
    L10n.load(newLocale);

    if (notify) {
      notifyListeners();
    }
  }

  void setLanguage(String languageCode) async {
    // set settings ("null" means use device language setting)
    setValue('languageCode', languageCode);

    // consider device language code if device language setting is activated
    if (languageCode == "null") {
      // List languages = await Devicelocale.preferredLanguages;
      Locale? locale = await Devicelocale.currentAsLocale;
      languageCode = locale!.languageCode;
    }

    // default to english locale of language code is not supported
    Locale newLocale;
    if (languageNameFromCode.keys.contains(languageCode)) {
      newLocale = Locale(languageCode);
    } else {
      newLocale = const Locale("en");
    }

    changeLocale(newLocale);
  }

  setValue(String key, dynamic value) {
    if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is List<String>) {
      prefs.setStringList(key, value);
    } else {
      return;
    }
    settings[key] = value;
  }

}
