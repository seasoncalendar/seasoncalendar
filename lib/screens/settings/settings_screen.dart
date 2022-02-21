import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:intl/intl.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:seasoncalendar/helpers/lang_helper.dart';
import 'package:seasoncalendar/helpers/user_db_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seasoncalendar/helpers/json_asset_loader.dart';
import 'package:seasoncalendar/models/availability.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/app_config.dart';
import 'package:seasoncalendar/screens/settings/settings_availabilities_dialog.dart';

class SettingsPage extends StatefulWidget {
  final Map<String, dynamic> _initialSettings;
  Map<String, dynamic>? _settings;
  String _versionInfo = "...";

  SettingsPage(Map<String, dynamic> initialSettings, {Key? key})
      : _initialSettings = initialSettings, super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  static Future<Map<String, dynamic>> getSettings() async {
    final initialSettings =
        await loadAssetFromJson("assets/initialsettings.json");
    return getSettingsI(initialSettings);
  }

  static Future<Map<String, dynamic>> getSettingsI(
      Map<String, dynamic> initialSettings) async {
    Map<String, dynamic> settings = {};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var key in initialSettings.keys) {
      settings[key] = prefs.get(key) ?? initialSettings[key];
    }
    return settings;
  }

  setSettingI(String key, dynamic newVal) async {
    widget._settings![key] = newVal;
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
        appBar: AppBar(title: Text(L10n.of(context).settingsPageTitle)),
        body: SingleChildScrollView(
            child: FutureBuilder(
                future: Future.wait(
                    [getSettingsI(widget._initialSettings), getVersionInfo()]),
                builder: (context, AsyncSnapshot<List<Object>> snapshot) {
                  if (snapshot.hasData) {
                    widget._settings =
                        snapshot.data![0] as Map<String, dynamic>;
                    widget._versionInfo = snapshot.data![1] as String;
                    return _buildSettings(
                        context, widget._settings, widget._versionInfo);
                  } else {
                    return const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator());
                  }
                })));
  }

  Future<String> getVersionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version + "+" + packageInfo.buildNumber;
  }

  Widget _buildSettings(BuildContext context, settings, versionInfo) {
    List<Widget> settingsItems = List<Widget>.empty(growable: true);

    settingsItems.add(SwitchListTile.adaptive(
      secondary: const Icon(Icons.folder_special),
      title: Text(L10n.of(context).settingsUncommonTitle),
      subtitle: Text(L10n.of(context).settingsUncommonText),
      value: widget._settings!["includeUncommon"],
      dense: false,
      onChanged: (newVal) {
        setSettingI("includeUncommon", newVal);
      },
    ));
    settingsItems.add(const Divider());

    settingsItems.add(SwitchListTile.adaptive(
      secondary: const Icon(Icons.sort),
      title: Text(L10n.of(context).settingsSortingTitle),
      value: widget._settings!["foodSorting"],
      dense: false,
      onChanged: (newVal) {
        setSettingI("foodSorting", newVal);
      },
    ));
    settingsItems.add(const Divider());

    showFilterFoodsDialog() {
      List<bool> avList = List.generate(
          avTypeCount, (i) => widget._settings![avSettingsKeys[i]]);
      var dialog = AvailabilitiesDialog(avList);
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(L10n.of(context).settingsFilterTitle),
          content: dialog,
          elevation: 10,
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/etc/howto");
              },
              child: const Icon(Icons.help),
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop(dialog.selectedAvailabilities);
                },
                child: Text(L10n.of(context).confirm)),
          ],
        ),
        barrierDismissible: true,
      ).then((ret) {
        if (ret != null) {
          for (int i in Iterable.generate(avTypeCount)) {
            setSettingI(avSettingsKeys[i], ret[i]);
          }
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
      secondary: Icon(Icons.edit_attributes_outlined),
      title: Text(
          "Custom availabilities"), //L10n.of(context).settingsEnableCustomAvTitle),
      subtitle: AppConfig.of(context).useCustomAv
          ? Text("Tab to hide custom availabilities")
          : //L10n.of(context).settingsDisableCustomAv),
          Text(
              "Tab to allow editing availability"), //L10n.of(context).settingsEnableCustomAv):
      value: AppConfig.of(context).useCustomAv,
      dense: false,
      onChanged: (newVal) {
        AppConfig.of(context, listen: false).useCustomAv = newVal;
      },
    ));
    settingsItems.add(const Divider());

    settingsItems.add(ListTileTheme(
      child: ListTile(
        leading: Icon(Icons.delete_forever),
        title: Text(L10n.of(context).settingsResetCustomAvTitle),
        isThreeLine: false,
        enabled: widget._settings!["useCustomAv"],
        dense: false,
        onTap: () async {
          bool? res = await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Are you sure?"),
              content: Text(
                  "Do you really want to delete your locally edited availability data. This action cannot be undone."),
              elevation: 10,
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("Delete"),
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
            UserDBProvider.db.deleteDB();
            var snackBar = const SnackBar(
              content: Text('Custom availability data was deleted!'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            Navigator.of(context).pushNamed("/settings").then((_) {
              Phoenix.rebirth(context);
            });
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
        widget._versionInfo +
            versionCodeSuffixFromAppFlavor(
                AppConfig.of(context, listen: false).flavor),
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

    return Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: settingsItems,
          ),
        ));
  }
}
