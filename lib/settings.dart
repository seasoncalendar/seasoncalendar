import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> initialSettings = {
  "popularFoodsOnly": false,
  "foodSorting": "alphabetical",
  "foodMinAvailability": 2.0
};

class SettingsPage extends StatefulWidget {

  @override
  SettingsPageState createState() => new SettingsPageState();
}

class SettingsPageState extends State<SettingsPage>{

  Map<String, dynamic> settings;

  @override
  void initState() {
    super.initState();
    setState(() {
      settings = initialSettings;
    });
  }

  void changeSetting(String name, newVal) async {
    setState(() {
      settings[name] = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings")
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile.adaptive(
              title: Text("Nur beliebte Sorten anzeigen"),
              value: settings["popularFoodsOnly"],
              dense: false,
              onChanged: (newVal) {changeSetting("popularFoodsOnly", newVal);},
            ),
            SwitchListTile.adaptive(
              title: Text("Sortierung"),
              subtitle: Text(settings["foodSorting"] == "alphabetical" ? "alphabetisch" : "nach Kategorie"),
              value: settings["foodSorting"] == "category",
              dense: false,
              onChanged: (newVal) {changeSetting("foodSorting", newVal ? "category" : "alphabetical");},
            ),
            Text("Minimale Verfügbarkeit für Anzeige"),
            Slider.adaptive(
              divisions: 4,
              min: 0,
              max: 4,
              value: settings["foodMinAvailability"],
              onChanged: (newVal) {changeSetting("foodMinAvailability", newVal);},
            )
          ],
        )
      )
    );
  }
}