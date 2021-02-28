import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/helpers/db_provider.dart';
import 'package:seasoncalendar/models/region.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/theme/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            future: Future.wait([
              SettingsPageState.getSettingsI(widget._initialSettings),
              DBProvider.db.getRegions()
            ]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> settings = snapshot.data[0];
                widget._settings = settings;
                var regionListTiles =
                    getRegionEntriesList(context, snapshot.data[1]);

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

  getRegionEntriesList(BuildContext context, Iterable<Region> regions) {
    // regions.sort();
    return regions.map((region) {
      return RadioListTile(
        activeColor: defaultTheme.accentColor,
        dense: false,
        value: region.id,
        groupValue: widget._settings['regionCode'],
        title: Text(region.name),
        onChanged: (val) => setState(() {
          setRegion(region.id);
        }),
      );
    }).toList();
  }
}
