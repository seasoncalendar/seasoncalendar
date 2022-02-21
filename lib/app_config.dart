import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:seasoncalendar/helpers/db_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/json_asset_loader.dart';
import 'generated/l10n.dart';
import 'helpers/lang_helper.dart';
import 'models/region.dart';

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

Future<List<dynamic>> appConfigFuture() async {
  String flavorStr = "googleplay";
  try {
    flavorStr = await const MethodChannel('flavor').invokeMethod<String>('getFlavor') ?? "googleplay";
  } on Exception{
    flavorStr = "googleplay";
    print('Failed to load flavor, defaulting to googleplay flavor!');
  }
  var pref = await SharedPreferences.getInstance();
  var initialSettings = await loadAssetFromJson("assets/initialsettings.json");
  var langCode = pref.getString("languageCode") ?? initialSettings["languageCode"]!;
  // initialize translation early to avoid bugs
  await L10n.load(const Locale("en"));
  if (langCode != "null") {
    await L10n.load(Locale(langCode));
  }
  var independentText = await loadAssetFromJson("assets/localization_independent_text.json");
  var regions = await DBProvider.db.getRegions();
  return [flavorStr, pref, initialSettings, independentText, regions];
}

class AppConfig extends ChangeNotifier {
  final AppFlavor flavor;
  final SharedPreferences prefs;
  final Map<String, dynamic> initialSettings;
  final Map<String, dynamic> independentText;
  final Map<String, dynamic> settings = {};
  Locale? locale;
  List<Region> regions;
  late Region curRegion;

  AppConfig.fromAsync(List<dynamic> asyncRes)
      : flavor = appFlavorFromString(asyncRes[0]),
        prefs = asyncRes[1],
        initialSettings = asyncRes[2],
        independentText = asyncRes[3],
        regions = asyncRes[4]
  {
    for (var key in initialSettings.keys) {
      settings[key] = prefs.get(key) ?? initialSettings[key];
    }

    // load and set locale  (note L10n already loaded)
    String? languageCode = settings['languageCode'];
    if (languageCode == null || languageCode == "null") {
      locale = null;
    } else {
      locale = Locale(languageCode);
    }

    var curRegionId = settings['regionCode'];
    curRegion = regions.firstWhere((r) => r.id == curRegionId);
  }

  static AppConfig of(BuildContext context, {bool listen = true}) {
    return Provider.of<AppConfig>(context, listen: listen);
  }

  bool get useCustomAv {
    return settings["useCustomAv"];
  }
  set useCustomAv(bool val) {
    setValue("useCustomAv", val);
    notifyListeners();
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

  setRegion(String regionCode) {
    prefs.setString('regionCode', regionCode);
    curRegion = regions.firstWhere((r) => r.id == regionCode);
    notifyListeners();
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
