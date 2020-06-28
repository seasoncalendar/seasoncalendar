import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> initialSettings = {
  "foodSorting": false, // false is alphabetical, true is categorical
  "foodMinAvailability": 0.0
};

class SettingsPage extends StatefulWidget {

  @override
  SettingsPageState createState() => new SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {

  static Future<Map<String, dynamic>> getSettings() async {
    Map<String, dynamic> settings = {};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    initialSettings.keys.forEach((key) {
      settings[key] = prefs.get(key) ?? initialSettings[key];
    });
    return settings;
  }

  setSettings(Map<String, dynamic> settings) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    settings.keys.forEach((key) {setValue(prefs, key, settings[key]);});
  }

  setSetting(String key, dynamic newVal) async {
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
        title: Text("Settings")
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getSettings(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> settings = snapshot.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SwitchListTile.adaptive(
                    title: Text("Sortierung"),
                    subtitle: Text(settings["foodSorting"] ? "nach Kategorie" : "alphabetisch"),
                    value: settings["foodSorting"],
                    dense: false,
                    onChanged: (newVal) {
                      setSetting("foodSorting", newVal);
                      },
                  ),
                  Text("Minimale Verfügbarkeit für Anzeige"),
                  Slider.adaptive(
                    divisions: 3,
                    min: 0,
                    max: 3,
                    value: settings["foodMinAvailability"],
                    onChanged: (newVal) {
                      setSetting("foodMinAvailability", newVal);
                      },
                  )
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          }
        )
      )
    );
  }
}