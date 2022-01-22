import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/helpers/db_provider.dart';
import 'package:seasoncalendar/models/region.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';
import 'package:seasoncalendar/theme/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRegionPage extends StatefulWidget {
  final Map<String, dynamic> _initialSettings;
  late Map<String, dynamic> _settings;

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
            builder: (context, AsyncSnapshot<List<Object>> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              var settings = snapshot.data![0] as Map<String, dynamic>;
              widget._settings = settings;
              var regions = snapshot.data![1] as Iterable<Region>;
              var regionListTiles = getRegionEntriesList(context, regions);

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
            }));
  }

  setRegion(BuildContext context, String regionCode) async {
    widget._settings['regionCode'] = regionCode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('regionCode', regionCode);

    Navigator.of(context).pushNamed("/settings").then((_) {
      Phoenix.rebirth(context); // restart application if new region
    });
  }

  getRegionEntriesList(BuildContext context, Iterable<Region> regions) {
    // regions.sort();
    return regions.map((region) {
      return RadioListTile(
        activeColor: Theme.of(context).colorScheme.secondary,
        dense: false,
        value: region.id,
        groupValue: widget._settings['regionCode'],
        title: Text(region.name),
        subtitle: region.fallbackRegion != null ? Text("fallback: ${region.fallbackRegion}") : null,
        onChanged: (val) => setState(() {
          setRegion(context, region.id);
        }),
      );
    }).toList();
  }
}
