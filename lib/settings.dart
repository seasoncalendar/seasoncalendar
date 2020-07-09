import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;

class SettingsPage extends StatefulWidget {

  Map<String, dynamic> _initialSettings;
  Map<String, dynamic> _settings;

  SettingsPage(Map<String, dynamic> initialSettings) {
    _initialSettings = initialSettings;
  }

  @override
  SettingsPageState createState() => new SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  
  static Future<Map<String, dynamic>> getSettings() async {
    final initialSettingsJson = await rootBundle.loadString("assets/initialsettings.json");
    return getSettingsI(json.decode(initialSettingsJson));
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
        title: Text(widget._initialSettings['settingsPageTitle'])
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getSettingsI(widget._initialSettings),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
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
        child: Column(
          children: <Widget>[
            SwitchListTile.adaptive(
              secondary: const Icon(Icons.sort_by_alpha),
              title: Text(widget._initialSettings['settingsSortingTitle']),
              subtitle: Text(widget._settings["foodSorting"]
                  ? widget._initialSettings['settingsSortingOnText']
                  : widget._initialSettings['settingsSortingOffText']),
              value: widget._settings["foodSorting"],
              dense: false,
              onChanged: (newVal) {
                setSetting("foodSorting", newVal);
              },
            ),
            ListTile(

              leading: Icon(Icons.visibility),
              title: Text(widget._initialSettings['settingsFilterTitle']),
              isThreeLine: false,
              subtitle: Text(widget._initialSettings['minAvailabilityIndicator'][widget._settings["foodMinAvailability"]]),
              dense: false,
            ),
            Slider.adaptive(
              divisions: 3,
              min: 0,
              max: 3,
              value: widget._settings["foodMinAvailability"],
              onChanged: (newVal) {
                setSetting("foodMinAvailability", newVal);
              },
            ),
          ],
        ),
      );
    }
  }
}
