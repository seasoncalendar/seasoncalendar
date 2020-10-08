import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/l10n/app_localizations.dart';

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context).aboutPageTitle)),
        body: Container(
            margin: EdgeInsets.all(18),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Text(AppLocalizations.of(context).aboutPageExplanationHeadline,
                    style: defaultTheme.textTheme.headline4),
                SizedBox(height: 20),
                Text(AppLocalizations.of(context).aboutPageExplanation,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.home, color: Colors.black),
                  title: Text(AppLocalizations.of(context).aboutPageAvLocal,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.local_shipping, color: Colors.black),
                  title: Text(AppLocalizations.of(context).aboutPageAvLand,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.directions_boat, color: Colors.black),
                  title: Text(AppLocalizations.of(context).aboutPageAvSea,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.airplanemode_active, color: Colors.black),
                  title: Text(AppLocalizations.of(context).aboutPageAvAir,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                SizedBox(height: 10),
                Text(AppLocalizations.of(context).aboutPageColors,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                Text(AppLocalizations.of(context).aboutPageFavorites,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                Text(AppLocalizations.of(context).aboutPageHeadline,
                    style: defaultTheme.textTheme.headline4),
                SizedBox(height: 20),
                Text(AppLocalizations.of(context).aboutPageLeading,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text(AppLocalizations.of(context).aboutPageAdvantage1,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text(AppLocalizations.of(context).aboutPageAdvantage2,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text(AppLocalizations.of(context).aboutPageAdvantage3,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text(AppLocalizations.of(context).aboutPageAdvantage4,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text(AppLocalizations.of(context).aboutPageAdvantage5,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                SizedBox(height: 20),
                Text(AppLocalizations.of(context).aboutPageTrailing,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 20),
                Text(AppLocalizations.of(context).aboutPageDisclaimer,
                    style: defaultTheme.textTheme.bodyText1
                        .copyWith(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify),
              ],
            ))));
  }
}
