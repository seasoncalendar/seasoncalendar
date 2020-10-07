import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/l10n/app_localizations.dart';

class SupportPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context).supportPageTitle)),
        body: Container(
            margin: EdgeInsets.all(18),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Text(AppLocalizations.of(context).supportPageSpreadTitle,
                    style: defaultTheme.textTheme.headline4),
                SizedBox(height: 20),
                Text(AppLocalizations.of(context).supportPageSpreadText1,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                Text(AppLocalizations.of(context).supportPageSpreadText2,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                Text(AppLocalizations.of(context).supportPageHeadline,
                    style: defaultTheme.textTheme.headline4),
                SizedBox(height: 20),
                Text(AppLocalizations.of(context).supportPageText1,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                Text(AppLocalizations.of(context).supportPageText2,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                RaisedButton(
                  child: Text(AppLocalizations.of(context).supportPageWebsiteLink),
                  onPressed: () async {
                    final url = AppLocalizations.of(context).websiteSupportPage;
                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        forceSafariVC: false,
                      );
                    }
                  },
                ),
              ],
            ))));
  }
}
