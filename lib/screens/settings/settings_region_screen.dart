import 'package:flutter/material.dart';
import 'package:seasoncalendar/app_config.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/models/region.dart';
import 'package:seasoncalendar/theme/themes.dart';

class SettingsRegionPage extends StatelessWidget {
  const SettingsRegionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var regions = AppConfig.of(context).regions;
    var regionListTiles = getRegionEntriesList(context, regions);

    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).settingsRegionTitle)),
        body: Container(
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
              ));
  }

  getRegionEntriesList(BuildContext context, Iterable<Region> regions) {
    // regions.sort();
    return regions.map((region) => RadioListTile(
        activeColor: Theme.of(context).colorScheme.secondary,
        dense: false,
        value: region.id,
        groupValue: AppConfig.of(context).curRegion.id,
        title: Text(region.name),
        subtitle: region.fallbackRegion != null
            ? Text("Fallback " + region.fallbackRegion!.name)
            : null,
        onChanged: (val) {
          AppConfig.of(context, listen: false).setRegion(region.id);
          Navigator.of(context).pop(region.id);
        })
      ).toList();
  }
}
