import 'package:flutter/material.dart';

import 'package:package_info_plus/package_info_plus.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seasoncalendar/helpers/json_asset_loader.dart';
import 'package:seasoncalendar/helpers/availabilities.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/app_config.dart';
import 'package:seasoncalendar/screens/settings/filterfoods/settings_filterfoods_dialog.dart';

class SettingsPage extends StatefulWidget {
  final Map<String, dynamic> _initialSettings;
  Map<String, dynamic>? _settings;
  String _versionInfo = "...";

  SettingsPage(Map<String, dynamic> initialSettings)
      : _initialSettings = initialSettings;

  @override
  SettingsPageState createState() => new SettingsPageState();
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
    initialSettings.keys.forEach((key) {
      settings[key] = prefs.get(key) ?? initialSettings[key];
    });
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
                    widget._settings = snapshot.data![0] as Map<String, dynamic>;
                    widget._versionInfo = snapshot.data![1] as String;
                    return _buildSettings(context, widget._settings, widget._versionInfo);
                  } else {
                    return Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator()
                    );
                  }
                })));
  }

  Future<String> getVersionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version + "+" + packageInfo.buildNumber;
  }

  Widget _buildSettings(BuildContext context) {
    if (widget._settings == null) {
      return Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    } else {
      GestureTapCallback showFilterFoodsDialog = () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: Colors.white,
            content: FilterfoodsDialog(List.generate(
                avTypeCount, (i) => widget._settings![avSettingsKeys[i]])),
            elevation: 10,
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/etc/howto");
                },
                child: Icon(Icons.help),
              ),
              MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(L10n.of(context).back)),
            ],
          ),
          barrierDismissible: true,
        );
      };

      return Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SwitchListTile.adaptive(
                  secondary: const Icon(Icons.folder_special),
                  title: Text(L10n.of(context).settingsUncommonTitle),
                  subtitle: Text(L10n.of(context).settingsUncommonText),
                  value: widget._settings!["includeUncommon"],
                  dense: false,
                  onChanged: (newVal) {
                    setSettingI("includeUncommon", newVal);
                  },
                ),
                const Divider(),
                SwitchListTile.adaptive(
                  secondary: const Icon(Icons.sort),
                  title: Text(L10n.of(context).settingsSortingTitle),
                  value: widget._settings!["foodSorting"],
                  dense: false,
                  onChanged: (newVal) {
                    setSettingI("foodSorting", newVal);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.visibility),
                  title: Text(L10n.of(context).settingsFilterTitle),
                  isThreeLine: false,
                  dense: false,
                  onTap: showFilterFoodsDialog,
                ),
                const Divider(),
                ListTileTheme(
                  child: ListTile(
                    leading: Icon(Icons.language),
                    title: Text(L10n.of(context).settingsRegionTitle),
                    isThreeLine: false,
                    dense: false,
                    onTap: () {
                      Navigator.of(context).pushNamed("/settings/region");
                    },
                  ),
                ),
                const Divider(),
                ListTileTheme(
                  child: ListTile(
                    leading: Icon(Icons.translate),
                    title: Text(L10n.of(context).settingsLanguageTitle),
                    isThreeLine: false,
                    dense: false,
                    onTap: () {
                      Navigator.of(context).pushNamed("/settings/language");
                    },
                  ),
                ),
                const Divider(),
                ListTileTheme(
                  child: ListTile(
                    leading: Icon(Icons.account_balance),
                    title: Text(L10n.of(context).imprintPageTitle),
                    isThreeLine: false,
                    dense: false,
                    onTap: () =>
                        {Navigator.of(context).pushNamed("/etc/imprint")},
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.info_outline),
                  enabled: false,
                  title: Text(L10n.of(context).settingsVersion),
                  trailing: Text(
                    widget._versionInfo +
                        versionCodeSuffixFromAppFlavor(
                            AppConfig.of(context).buildFlavor),
                    style: const TextStyle(color: Colors.black38),
                  ),
                  isThreeLine: false,
                  dense: false,
                ),
              ],
            ),
          ));
    }
  }
}
