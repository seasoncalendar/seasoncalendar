import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/theme/themes.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/l10n/app_localizations.dart';
import 'package:seasoncalendar/main.dart';

class SettingsLanguagePage extends StatefulWidget {
  final Map<String, dynamic> _initialSettings;
  Map<String, dynamic> _settings;

  SettingsLanguagePage(Map<String, dynamic> initialSettings)
      : _initialSettings = initialSettings;

  @override
  SettingsLanguagePageState createState() => new SettingsLanguagePageState();
}

class SettingsLanguagePageState extends State<SettingsLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context).settingsLanguageTitle)),
        body: FutureBuilder(
            future: SettingsPageState.getSettingsI(widget._initialSettings),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> settings = snapshot.data;
                widget._settings = settings;
                var languageListTiles = getLanguageEntriesList(context);

                return Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ListView.separated(
                    itemCount: languageListTiles.length,
                    itemBuilder: (context, i) {
                      return ListTileTheme(
                          selectedColor: defaultListTileTheme.selectedColor,
                          child: languageListTiles[i]);
                    },
                    separatorBuilder: (context, i) => const Divider(
                      height: 10,
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }));
  }

  setLanguage(String languageCode) async {
    print("new lang code: ");
    print(languageCode);
    widget._settings['languageCode'] = languageCode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', languageCode);

    Locale newLocale;
    if (languageNameFromCode.keys.contains(languageCode)) {
      newLocale = Locale(languageCode);
    }
    MyAppState state = context.findAncestorStateOfType<MyAppState>();
    state.setState(() {
      state.locale = newLocale;
    });
  }

  getLanguageEntriesList(BuildContext context) {
    List<ListTile> languageEntries = List<ListTile>();

    ListTile defaultLocaleTile = ListTile(
      dense: false,
      selected: widget._settings['languageCode'] == "null",
      title: Text(AppLocalizations.of(context).settingsLanguageUseLocale),
      subtitle: Text(AppLocalizations.of(context).settingsLanguageUseLocaleSub),
      onTap: () => setState(() {
        setLanguage("null");
      }),
    );
    languageEntries.add(defaultLocaleTile);

    var orderedLocales = List.from(AppLocalizations.supportedLocales);
    orderedLocales.sort((a, b) => a.languageCode.compareTo(b.languageCode));
    orderedLocales.forEach((locale) {
      languageEntries.add(getLanguageListTile(locale.languageCode));
    });

    return languageEntries;
  }

  getLanguageListTile(String langCode) {
    return ListTile(
      dense: false,
      selected: widget._settings['languageCode'] == langCode,
      title: Text(languageNameFromCode[langCode]),
      onTap: () => setState(() {
        setLanguage(langCode);
      }),
    );
  }

  final Map<String, String> languageNameFromCode = {
    "en": "English",
    "de": "Deutsch",
    "pl": "Polski"
  };
}
