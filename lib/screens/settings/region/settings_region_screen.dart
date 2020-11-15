import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/theme/themes.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/generated/l10n.dart';

class SettingsRegionPage extends StatefulWidget {
  final Map<String, dynamic> _initialSettings;
  Map<String, dynamic> _settings;

  SettingsRegionPage(Map<String, dynamic> initialSettings)
      : _initialSettings = initialSettings;

  @override
  SettingsRegionPageState createState() => new SettingsRegionPageState();
}

class SettingsRegionPageState extends State<SettingsRegionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).settingsRegionTitle)),
        body: FutureBuilder(
            future: SettingsPageState.getSettingsI(widget._initialSettings),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> settings = snapshot.data;
                widget._settings = settings;
                var regionListTiles = getRegionEntriesList(context);

                return Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ListView.separated(
                    itemCount: regionListTiles.length,
                    itemBuilder: (context, i) {
                      return ListTileTheme(
                          selectedColor: defaultListTileTheme.selectedColor,
                          child: regionListTiles[i]);
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

  setRegion(String regionCode) async {
    widget._settings['regionCode'] = regionCode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('regionCode', regionCode);
  }

  getRegionEntriesList(BuildContext context) {
    List<RadioListTile> regionEntries = List<RadioListTile>();

    var orderedRegions = supportedRegionCodes;
    orderedRegions.sort();
    orderedRegions.forEach((regionCode) {
      regionEntries.add(getRegionRadioListTile(context, regionCode));
    });

    return regionEntries;
  }

  getRegionRadioListTile(BuildContext context, String regionCode) {
    return RadioListTile(
      activeColor: defaultTheme.accentColor,
      dense: false,
      value: regionCode,
      groupValue: widget._settings['regionCode'],
      title: Text(getRegionNameFromCode(context, regionCode)),
      onChanged: (val) => setState(() {
        setRegion(regionCode);
      }),
    );
  }

  String getRegionNameFromCode(BuildContext context, String regionCode) {
    switch (regionCode) {
      case "CE":
        return L10n.of(context).centralEurope;
      case "DE":
        return L10n.of(context).centralEurope;
      default:
        return L10n.of(context).centralEurope;
    }
  }

  final List<String> supportedRegionCodes = ["CE"];
}
