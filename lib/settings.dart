import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/helpers/themes.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/jsonassetloader.dart';

class SettingsPage extends StatefulWidget {

  final Map<String, dynamic> _initialSettings;
  final Map<String, dynamic> _settingsText;
  Map<String, dynamic> _settings;

  SettingsPage(Map<String, dynamic> initialSettings, Map<String, dynamic> settingsText):
    _initialSettings = initialSettings, _settingsText = settingsText;

  @override
  SettingsPageState createState() => new SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  
  static Future<Map<String, dynamic>> getSettings() async {
    final initialSettings = await loadAssetFromJson("assets/initialsettings.json");
    return getSettingsI(initialSettings);
  }

  static Future<Map<String, dynamic>> getSettingsI(Map<String, dynamic> initialSettings) async {
    Map<String, dynamic> settings = {};
    SharedPreferences prefs = await SharedPreferences.getInstance();

    initialSettings.keys.forEach((key) {
      settings[key] = prefs.get(key) ?? initialSettings[key];
    });
    return settings;
  }

  setSetting(String key, dynamic newVal) async {
    widget._settings[key] = newVal;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setValue(prefs, key, newVal);
  }

  setValue(SharedPreferences prefs, String key, dynamic value) {
    setState(() {
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
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget._settingsText['settingsPageTitle'])
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getSettingsI(widget._initialSettings),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> settings = snapshot.data;
              widget._settings = settings;
            }
            return _buildSettings(context);
          }
        )
      )
    );
  }

  Widget _buildSettings(BuildContext context) {
    if (widget._settings == null) {
      return Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    }
    else {
      return Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SwitchListTile.adaptive(
                secondary: const Icon(Icons.sort_by_alpha),
                title: Text(widget._settingsText['settingsSortingTitle']),
                subtitle: Text(widget._settings["foodSorting"]
                    ? widget._settingsText['settingsSortingOnText']
                    : widget._settingsText['settingsSortingOffText']),
                value: widget._settings["foodSorting"],
                dense: false,
                onChanged: (newVal) {
                  setSetting("foodSorting", newVal);
                },
              ),
              SwitchListTile.adaptive(
                secondary: const Icon(Icons.category),
                subtitle: Text(widget._settings["includeUncommon"]
                    ? widget._settingsText['settingsUncommonOnText']
                    : widget._settingsText['settingsUncommonOffText']),
                value: widget._settings["includeUncommon"],
                dense: false,
                onChanged: (newVal) {
                  setSetting("includeUncommon", newVal);
                },
              ),
              ListTile(
                leading: Icon(Icons.visibility),
                title: Text(widget._settingsText['settingsFilterTitle']),
                isThreeLine: false,
                subtitle: Text(widget._settingsText['minAvailabilityIndicator'][widget._settings["foodMinAvailability"].round().toString()]),
                dense: false,
              ),
              Slider.adaptive(
                divisions: 3,
                min: 0,
                max: 3,
                activeColor: defaultTheme.accentColor,
                inactiveColor: defaultTheme.primaryColor,
                value: widget._settings["foodMinAvailability"],
                onChanged: (newVal) {
                  setSetting("foodMinAvailability", newVal);
                },
              ),
              ListTileTheme(
                selectedColor: Colors.lightGreen[700],
                child: ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text(widget._settingsText['imprintPageTitle']),
                  isThreeLine: false,
                  dense: false,
                  selected: true,
                  onTap: () => {Navigator.of(context).pushNamed("/imprint")},
                ),
              ),
            ],
          ),
        )
      );
    }
  }
}
