import 'package:flutter/material.dart';
import 'package:seasoncalendar/app_config.dart';


import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/helpers/lang_helper.dart';

class SettingsLanguagePage extends StatelessWidget {
  const SettingsLanguagePage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    var languageListTiles = getLanguageEntries(context);

    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).settingsLanguageTitle)),
        body: Container(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
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
                    ))
            );
  }

  getLanguageRadioListTile(BuildContext context, String langCode) {
    String languageName = "NONE";
    if (languageNameFromCode.containsKey(langCode)) {
      languageName = languageNameFromCode[langCode]!;
    }
    if (!completeLanguages.contains(langCode)) {
      languageName += " (Beta)";
    }
    return RadioListTile(
      activeColor: Theme.of(context).colorScheme.secondary,
      dense: false,
      value: langCode,
      groupValue: AppConfig.of(context).languageCode,
      title: Text("${langCode.toUpperCase()} - $languageName"),
      onChanged: (_) {
        AppConfig.of(context, listen: false).setLanguage(langCode);
        Navigator.of(context).pop(langCode);
      }
    );
  }

  getLanguageEntries(BuildContext context) {
    List<RadioListTile> languageEntries = [getDeviceLanguageEntry(context)];
    List<String> localeLangCodes = L10n.delegate.supportedLocales
        .map((locale) => locale.languageCode)
        .where((langCode) => !nonDisplayableLanguages.contains(langCode))
        .toList();
    localeLangCodes.sort();
    languageEntries.addAll(localeLangCodes
        .map((langCode) => getLanguageRadioListTile(context, langCode)));
    return languageEntries;
  }

  getDeviceLanguageEntry(BuildContext context) {
    return RadioListTile<String>(
      activeColor: Theme.of(context).colorScheme.secondary,
      dense: false,
      value: "null",
      groupValue: AppConfig.of(context).languageCode,
      title: Text(L10n.of(context).settingsLanguageUseLocale),
      subtitle: Text(L10n.of(context).settingsLanguageUseLocaleSub),
      onChanged: (String? val) {
        AppConfig.of(context, listen: false).setLanguage(val!);
      }
    );
  }
}
