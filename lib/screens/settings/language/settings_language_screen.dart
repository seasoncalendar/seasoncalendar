import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:devicelocale/devicelocale.dart';

import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/helpers/lang_helper.dart';
import 'package:seasoncalendar/main.dart';

class SettingsLanguagePage extends StatefulWidget {
  final Map<String, dynamic> _initialSettings;
  late Map<String, dynamic> _settings;

  SettingsLanguagePage(Map<String, dynamic> initialSettings)
      : _initialSettings = initialSettings;

  @override
  SettingsLanguagePageState createState() => new SettingsLanguagePageState();
}

class SettingsLanguagePageState extends State<SettingsLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).settingsLanguageTitle)),
        body: FutureBuilder(
            future: SettingsPageState.getSettingsI(widget._initialSettings),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var settings = snapshot.data! as Map<String, dynamic>;
                widget._settings = settings;

                var languageListTiles = getLanguageEntries();

                return Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(L10n.of(context).incompleteLanguageNotice,
                              textAlign: TextAlign.left,
                              style: defaultTheme.textTheme.bodyText1?.copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey[600])),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemCount: languageListTiles.length,
                            itemBuilder: (context, i) {
                              return ListTileTheme(
                                  selectedColor:
                                      defaultListTileTheme.selectedColor,
                                  child: languageListTiles[i]);
                            },
                            separatorBuilder: (context, i) => const Divider(
                              height: 10,
                            ),
                          ),
                        ),
                      ],
                    ));
              } else {
                return Container();
              }
            }));
  }

  setLanguage(String languageCode) async {
    widget._settings['languageCode'] = languageCode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', languageCode);

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
      newLocale = Locale("en");
    }
    MyApp.setLocale(context, newLocale);
  }

  getLanguageRadioListTile(String langCode) {
    String languageName = "NONE";
    if (languageNameFromCode.containsKey(langCode)) {
      languageName = languageNameFromCode[langCode]!;
    }
    if (!completeLanguages.contains(langCode)) {
      languageName += " (Beta)";
    }
    return RadioListTile(
      activeColor: defaultTheme.accentColor,
      dense: false,
      value: langCode,
      groupValue: widget._settings['languageCode'],
      title: Text("${langCode.toUpperCase()} - $languageName"),
      onChanged: (val) => setState(() {
        setLanguage(langCode);
      }),
    );
  }

  getLanguageEntries() {
    List<RadioListTile> languageEntries = [getDeviceLanguageEntry()];
    List<String> localeLangCodes = L10n.delegate.supportedLocales
        .map((locale) => locale.languageCode)
        .where((langCode) => !nonDisplayableLanguages.contains(langCode))
        .toList();
    localeLangCodes.sort();
    languageEntries.addAll(
        localeLangCodes.map((langCode) => getLanguageRadioListTile(langCode)));
    return languageEntries;
  }

  getDeviceLanguageEntry() {
    return RadioListTile<String>(
      activeColor: defaultTheme.accentColor,
      dense: false,
      value: "null",
      groupValue: widget._settings['languageCode'],
      title: Text(L10n.of(context).settingsLanguageUseLocale),
      subtitle: Text(L10n.of(context).settingsLanguageUseLocaleSub),
      onChanged: (String? val) => setState(() {
        setLanguage(val!);
      }),
    );
  }
}
