import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:intl/intl.dart';

import 'package:package_info_plus/package_info_plus.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seasoncalendar/helpers/json_asset_loader.dart';
import 'package:seasoncalendar/models/availability.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/app_config.dart';
import 'package:seasoncalendar/components/availabilities_dialog.dart';

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

  clearSettings(BuildContext? context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    widget._settings = Map.from(widget._initialSettings);
    // TODO set SharedPreferences to initialSettings?

    if (context != null) {
      const snackBar = SnackBar(
        content: Text('Settings reset!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // todo rebirth overrides the SnackBar notification
      // but is currently required to reset the apps state
      Phoenix.rebirth(context);
    }
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
    showFilterFoodsDialog() {
      List<bool> avList = List.generate(avTypeCount, (i) => widget._settings![avSettingsKeys[i]]);
      var dialog = AvailabilitiesDialog(avList);
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.white,
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
        for (int i in Iterable.generate(avTypeCount)) {
          setSettingI(avSettingsKeys[i], dialog.selectedAvailabilities[i]);
        }
      });
    }

    return Container(
        margin: const EdgeInsets.all(10),
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
                leading: const Icon(Icons.visibility),
                title: Text(L10n.of(context).settingsFilterTitle),
                isThreeLine: false,
                dense: false,
                onTap: showFilterFoodsDialog,
              ),
              const Divider(),
              ListTileTheme(
                child: ListTile(
                  leading: const Icon(Icons.translate),
                  title: Text(L10n.of(context).settingsLanguageTitle),
                  trailing: Text(Intl.defaultLocale!),
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
                  enabled: true,
                  leading: const Icon(Icons.language),
                  title: Text(L10n.of(context).settingsRegionTitle),
                  trailing: Text(widget._settings?['regionCode']),
                  isThreeLine: false,
                  dense: false,
                  onTap: () {
                    Navigator.of(context).pushNamed("/settings/region");
                  },
                ),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                secondary: Icon(Icons.edit_attributes_outlined),
                title: Text(L10n.of(context).settingsEnableCustomAvTitle),
                subtitle: Text(L10n.of(context).settingsEnableCustomAvSubtitle),
                value: widget._settings!["useCustomAv"],
                dense: false,
                onChanged: (newVal) {
                  setSettingI("useCustomAv", newVal);
                },
              ),
              const Divider(),
              ListTileTheme(
                child: ListTile(
                  leading: Icon(Icons.delete_forever),
                  title: Text(L10n.of(context).settingsResetCustomAvTitle),
                  isThreeLine: false,
                  dense: false,
                  onTap: () {/*Display alert dialog then empty foods_av_custom*/
                  },
                ),
              ),
              const Divider(),
              ListTileTheme(
                child: ListTile(
                  leading: const Icon(Icons.account_balance),
                  title: Text(L10n.of(context).imprintPageTitle),
                  isThreeLine: false,
                  dense: false,
                  onTap: () =>
                      {Navigator.of(context).pushNamed("/etc/imprint")},
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.info_outline),
                enabled: kDebugMode,
                title: Text(L10n.of(context).settingsVersion),
                trailing: Text(
                  widget._versionInfo +
                      versionCodeSuffixFromAppFlavor(
                          AppConfig.of(context).buildFlavor),
                  style: const TextStyle(color: Colors.black38),
                ),
                isThreeLine: false,
                dense: false,
                onLongPress:  () => clearSettings(context),
              ),
            ],
          ),
        ));
  }
}
