import 'dart:developer';

import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
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
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  var versionInfo = packageInfo.version + "+" + packageInfo.buildNumber;
  
  String flavorStr = "googleplay";
  try {
    flavorStr = await const MethodChannel('flavor').invokeMethod<String>('getFlavor') ?? "googleplay";
  } on Exception{
    flavorStr = "googleplay";
    log('Failed to load flavor, defaulting to googleplay flavor!');
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
  return [versionInfo, flavorStr, pref, initialSettings, independentText, regions];
}

class AppConfig extends ChangeNotifier {
  final String versionInfo;
  final AppFlavor flavor;
  final SharedPreferences prefs;
  final Map<String, dynamic> initialSettings;
  final Map<String, dynamic> independentText;
  Locale? locale;
  List<Region> regions;
  late Region curRegion;

  AppConfig.fromAsync(List<dynamic> asyncRes)
      : versionInfo = asyncRes[0],
        flavor = appFlavorFromString(asyncRes[1]),
        prefs = asyncRes[2],
        initialSettings = asyncRes[3],
        independentText = asyncRes[4],
        regions = asyncRes[5]
  {
    // load and set locale  (note L10n already loaded)
    String? languageCode = getValue('languageCode');
    if (languageCode != null && languageCode != "null") {
      locale = Locale(languageCode);
    }

    loadRegion();
  }

  static AppConfig of(BuildContext context, {bool listen = true}) {
    return Provider.of<AppConfig>(context, listen: listen);
  }

  String get versionFull {
    return versionInfo + versionCodeSuffixFromAppFlavor(flavor);
  }

  String get languageCode {
    return getValue("languageCode")!;
  }

  bool get useCustomAv {
    return getValue("useCustomAv")!;
  }
  set useCustomAv(bool val) {
    setValue("useCustomAv", val);
    notifyListeners();
  }

  void changeLocale(Locale newLocale, {notify = true}) async {
    if (locale == newLocale) return;

    locale = newLocale;
    await L10n.load(newLocale);
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

  loadRegion() {
    var curRegionId = getValue('regionCode');
    curRegion = regions.firstWhere((r) => r.id == curRegionId);
  }

  setRegion(String regionCode) {
    prefs.setString('regionCode', regionCode);
    curRegion = regions.firstWhere((r) => r.id == regionCode);
    notifyListeners();
  }

  /// Setting directly does not notify listeners
  Future<dynamic> setValue(String key, dynamic value) {
    if (value is bool) {
      return prefs.setBool(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is String) {
      return prefs.setString(key, value);
    } else if (value is List<String>) {
      return prefs.setStringList(key, value);
    } else {
      return Future.value(null);
    }
  }

  dynamic getValue(String key) {
    return prefs.get(key) ?? initialSettings[key];
  }

  /// Use with cation as not all changes will to preferences will prompt notify
  Map<String, dynamic> getPreferences() {
    Map<String, dynamic> prefsMap = {};
    for (var key in initialSettings.keys) {
      prefsMap[key] = getValue(key);
    }
    return prefsMap;
  }

  clearSettings() async {
    prefs.clear();
    setLanguage(getValue('languageCode'));
    loadRegion();
    notifyListeners();
  }

}
