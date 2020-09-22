import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/theme/themes.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SettingsFilterSettingPage extends StatefulWidget {
  final Map<String, dynamic> _initialSettings;
  final Map<String, dynamic> _settingsText;
  Map<String, dynamic> _settings;

  SettingsFilterSettingPage(
      Map<String, dynamic> initialSettings, Map<String, dynamic> settingsText)
      : _initialSettings = initialSettings,
        _settingsText = settingsText;

  @override
  SettingsFilterSettingPageState createState() =>
      new SettingsFilterSettingPageState();
}

class SettingsFilterSettingPageState extends State<SettingsFilterSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text(widget._settingsText['settingsFilterTitle'])),
        body: FutureBuilder(
            future: SettingsPageState.getSettingsI(widget._initialSettings),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> settings = snapshot.data;
                widget._settings = settings;

                return Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ListView.separated(
                    itemCount:
                        widget._settingsText['minAvailabilityIndicator'].length,
                    itemBuilder: (context, i) {
                      return RadioListTile(
                          dense: false,
                          activeColor: defaultTheme.accentColor,
                          value: i,
                          groupValue:
                              widget._settings['foodMinAvailability'].round(),
                          title: Text(
                              widget._settingsText['minAvailabilityIndicator']
                                  [i.toString()]),
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
