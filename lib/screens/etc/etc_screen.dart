import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/l10n/app_localizations.dart';


class EtcPage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(title: Text(AppLocalizations.of(context).etcPageTitle)),
        body: Container(
            margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text(AppLocalizations.of(context).aboutPageTitle),
                    onTap: () => Navigator.of(context).pushNamed("/etc/about"),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.extension),
                    title: Text(AppLocalizations.of(context).contribPageTitle),
                    onTap: () => Navigator.of(context).pushNamed("/etc/contrib"),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text(AppLocalizations.of(context).supportPageTitle),
                    onTap: () => Navigator.of(context).pushNamed("/etc/support"),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.account_balance),
                    title: Text(AppLocalizations.of(context).imprintPageTitle),
                    onTap: () => Navigator.of(context).pushNamed("/etc/imprint"),
                  ),
                ],
              ),
            ))
    );
  }
}
