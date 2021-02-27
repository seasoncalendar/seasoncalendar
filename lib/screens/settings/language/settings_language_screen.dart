import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/theme/themes.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seasoncalendar/helpers/lang_names.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/generated/l10n.dart';
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
            title: Text(L10n.of(context).settingsLanguageTitle)),
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
    widget._settings['languageCode'] = languageCode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', languageCode);

    Locale newLocale;
    if (languageNameFromCode.keys.contains(languageCode)) {
      newLocale = Locale(languageCode);
    }
    MyApp.setLocale(context, newLocale);
  }

  getLanguageEntriesList(BuildContext context) {
    List<RadioListTile> languageEntries = List<RadioListTile>();

    RadioListTile defaultLocaleTile = RadioListTile(
      activeColor: defaultTheme.accentColor,
      dense: false,
      value: "null",
      groupValue: widget._settings['languageCode'],
      title: Text(L10n.of(context).settingsLanguageUseLocale),
      subtitle: Text(L10n.of(context).settingsLanguageUseLocaleSub),
      onChanged: (val) => setState(() {
        setLanguage(val);
      }),
    );
    languageEntries.add(defaultLocaleTile);

    var orderedLocales = List.from(L10n.delegate.supportedLocales);
    orderedLocales.sort((a, b) => a.languageCode.compareTo(b.languageCode));
    orderedLocales.forEach((locale) {
      languageEntries.add(getLanguageRadioListTile(locale.languageCode));
    });

    return languageEntries;
  }

  getLanguageRadioListTile(String langCode) {
    return RadioListTile(
      activeColor: defaultTheme.accentColor,
      dense: false,
      value: langCode,
      groupValue: widget._settings['languageCode'],
      title: Text(languageNameFromCode[langCode]),
      onChanged: (val) => setState(() {
        setLanguage(langCode);
      }),
    );
  }
}
