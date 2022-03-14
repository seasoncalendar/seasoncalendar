import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/helpers/lang_helper.dart';
import 'package:seasoncalendar/models/availability.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/app_config.dart';
import 'package:seasoncalendar/screens/settings/settings_availabilities_dialog.dart';

import '../../app_data.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> settingsItems = List<Widget>.empty(growable: true);

    settingsItems.add(SwitchListTile.adaptive(
      secondary: const Icon(Icons.folder_special),
      title: Text(L10n.of(context).settingsUncommonTitle),
      subtitle: Text(L10n.of(context).settingsUncommonText),
      value: AppConfig.of(context, listen: false).getValue("includeUncommon"),
      dense: false,
      onChanged: (newVal) {
        setState(() {
          AppConfig.of(context, listen: false).setValue("includeUncommon", newVal);
        });
      },
    ));
    settingsItems.add(const Divider());

    settingsItems.add(SwitchListTile.adaptive(
      secondary: const Icon(Icons.sort),
      title: Text(L10n.of(context).settingsSortingTitle),
      value: AppConfig.of(context, listen: false).getValue("foodSorting"),
      dense: false,
      onChanged: (newVal) {
        setState(() {
          AppConfig.of(context, listen: false).setValue("foodSorting", newVal);
        });
      },
    ));
    settingsItems.add(const Divider());

    showFilterFoodsDialog() {
      List<bool> avList = List.generate(
          avIcons.length, (i) {
            return AppConfig.of(context, listen: false).getValue(avSettingsKeys[i]);
          }
      );
      showDialog(
        context: context,
          barrierDismissible: true,
          builder: (_) => SettingsAvailabilitiesDialog(avList,
            title: Text(L10n.of(context).settingsFilterTitle),
        ),
      ).then((ret) {
        if (ret != null) {
          setState(() {
            for (int i in Iterable.generate(avSettingsKeys.length)) {
              AppConfig.of(context, listen: false)
                  .setValue(avSettingsKeys[i], ret[i]);
              //setSettingI(avSettingsKeys[i], ret[i]);
            }
          });
        }
      });
    }

    settingsItems.add(ListTile(
      leading: const Icon(Icons.visibility),
      title: Text(L10n.of(context).settingsFilterTitle),
      isThreeLine: false,
      dense: false,
      onTap: showFilterFoodsDialog,
    ));
    settingsItems.add(const Divider());

    var languageCode = AppConfig.of(context).locale!.languageCode;
    var languageName = languageNameFromCode[languageCode] ?? languageCode;
    languageName = languageName.length > 20 ? languageCode : languageName;

    settingsItems.add(ListTileTheme(
      child: ListTile(
        leading: const Icon(Icons.translate),
        title: Text(L10n.of(context).settingsLanguageTitle),
        trailing: Text(languageName),
        isThreeLine: false,
        dense: false,
        onTap: () {
          Navigator.of(context).pushNamed("/settings/language");
        },
      ),
    ));
    settingsItems.add(const Divider());

    var region = AppConfig.of(context).curRegion;
    var regionName = region.name.length > 25 ? region.id : region.name;

    settingsItems.add(ListTileTheme(
      child: ListTile(
        enabled: true,
        leading: const Icon(Icons.language),
        title: Text(L10n.of(context).settingsRegionTitle),
        trailing: Text(regionName),
        isThreeLine: false,
        dense: false,
        onTap: () {
          Navigator.of(context).pushNamed("/settings/region");
        },
      ),
    ));
    settingsItems.add(const Divider());

    settingsItems.add(SwitchListTile.adaptive(
      secondary: const Icon(Icons.edit_note),
      title: Text(L10n.of(context).settingsEnableCustomAvTitle),
      subtitle: AppConfig.of(context).useCustomAv
          ? Text(L10n.of(context).settingsCustomAvDisable)
          : Text(L10n.of(context).settingsCustomAvEnable),
      value: AppConfig.of(context).useCustomAv,
      dense: false,
      onChanged: (newVal) {
        AppConfig.of(context, listen: false).useCustomAv = newVal;
      },
    ));
    settingsItems.add(const Divider());

    settingsItems.add(ListTileTheme(
      child: ListTile(
        leading: const Icon(Icons.delete_forever),
        title: Text(L10n.of(context).settingsResetCustomAvTitle),
        isThreeLine: false,
        enabled: AppConfig.of(context, listen: false).getValue("useCustomAv"),
        dense: false,
        onTap: () async {
          bool? res = await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(L10n.of(context).confirmOperation),
              content: Text(L10n.of(context).customAvDeletePrompt),
              elevation: 10,
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(L10n.of(context).delete),
                ),
                MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(L10n.of(context).back)),
              ],
            ),
          );
          if (res ?? false) {
            await AppData.of(context, listen: false).deleteCustomAvailabilities();

            var snackBar = const SnackBar(
              content: Text('Personalized availabilities were deleted!'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      ),
    ));
    settingsItems.add(const Divider());

    settingsItems.add(ListTileTheme(
      child: ListTile(
        leading: const Icon(Icons.account_balance),
        title: Text(L10n.of(context).imprintPageTitle),
        isThreeLine: false,
        dense: false,
        onTap: () => {Navigator.of(context).pushNamed("/etc/imprint")},
      ),
    ));
    settingsItems.add(const Divider());

    settingsItems.add(ListTile(
      leading: const Icon(Icons.info_outline),
      enabled: kDebugMode,
      title: Text(L10n.of(context).settingsVersion),
      trailing: Text(
        AppConfig.of(context, listen: false).versionFull,
        style: const TextStyle(color: Colors.black38),
      ),
      isThreeLine: false,
      dense: false,
      onLongPress: () {
        AppConfig.of(context, listen: false).clearSettings();
        const snackBar = SnackBar(
          content: Text('Settings reset!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    ));

    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).settingsPageTitle)),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: settingsItems,
            )
          )
        ),
    );
  }
}
