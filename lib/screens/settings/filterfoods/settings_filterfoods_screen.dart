import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/l10n/app_localizations.dart';
import 'package:seasoncalendar/helpers/text_selector.dart';


class SettingsFilterSettingPage extends StatefulWidget {
  final Map<String, dynamic> _initialSettings;
  Map<String, dynamic> _settings;

  SettingsFilterSettingPage(Map<String, dynamic> initialSettings)
      : _initialSettings = initialSettings;

  @override
  SettingsFilterSettingPageState createState() =>
      new SettingsFilterSettingPageState();
}

class SettingsFilterSettingPageState extends State<SettingsFilterSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text(AppLocalizations.of(context).settingsFilterTitle)),
        body: FutureBuilder(
            future: SettingsPageState.getSettingsI(widget._initialSettings),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> settings = snapshot.data;
                widget._settings = settings;

                return Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ListView.separated(
                    itemCount: avTypeCount,
                    itemBuilder: (context, i) {
                      return RadioListTile(
                          dense: false,
                          activeColor: defaultTheme.accentColor,
                          value: i,
                          groupValue:
                              widget._settings['foodMinAvailability'].round(),
                          title: Text(getMinAvTextFromIndex(context, i)),
                          onChanged: (val) => setState(() {
                                setFoodFiltering(val);
                              }));
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

  setFoodFiltering(int newVal) async {
    widget._settings['foodMinAvailability'] = newVal;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('foodMinAvailability', newVal);
  }
}
