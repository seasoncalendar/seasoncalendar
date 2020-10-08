import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:package_info/package_info.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seasoncalendar/helpers/json_asset_loader.dart';
import 'package:seasoncalendar/l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  final Map<String, dynamic> _initialSettings;
  Map<String, dynamic> _settings;
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
        appBar: AppBar(title: Text(AppLocalizations.of(context).settingsPageTitle)),
        body: SingleChildScrollView(
            child: FutureBuilder(
                future: Future.wait(
                    [getSettingsI(widget._initialSettings), getVersionInfo()]),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map<String, dynamic> settings = snapshot.data[0];
                    widget._settings = settings;
                    widget._versionInfo = snapshot.data[1];
                  }
                  return _buildSettings(context);
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
      return Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SwitchListTile.adaptive(
                  secondary: const Icon(Icons.folder_special),
                  title: Text(AppLocalizations.of(context).settingsUncommonTitle),
                  subtitle: Text(AppLocalizations.of(context).settingsUncommonText),
                  value: widget._settings["includeUncommon"],
                  dense: false,
                  onChanged: (newVal) {
                    setSettingI("includeUncommon", newVal);
                  },
                ),
                const Divider(),
                SwitchListTile.adaptive(
                  secondary: const Icon(Icons.sort),
                  title: Text(AppLocalizations.of(context).settingsSortingTitle),
                  value: widget._settings["foodSorting"],
                  dense: false,
                  onChanged: (newVal) {
                    setSettingI("foodSorting", newVal);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.visibility),
                  title: Text(AppLocalizations.of(context).settingsFilterTitle),
                  isThreeLine: false,
                  dense: false,
                  onTap: () =>
                      Navigator.of(context).pushNamed("/settings/filter"),
                ),
                const Divider(),
                ListTileTheme(
                  child: ListTile(
                    leading: Icon(Icons.account_balance),
                    title: Text(AppLocalizations.of(context).imprintPageTitle),
                    isThreeLine: false,
                    dense: false,
                    onTap: () => {Navigator.of(context).pushNamed("/etc/imprint")},
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.info_outline),
                  enabled: false,
                  title: Text('Version'),
                  trailing: Text(
                    widget._versionInfo,
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
