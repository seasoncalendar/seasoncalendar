import 'package:flutter/material.dart';
import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/generated/l10n.dart';

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).aboutPageTitle)),
        body: Container(
            margin: EdgeInsets.all(18),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Text(L10n.of(context).aboutPageHeadline,
                    style: defaultTheme.textTheme.headline4),
                SizedBox(height: 20),
                Text(L10n.of(context).aboutPageLeading,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text(L10n.of(context).aboutPageAdvantage1,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text(L10n.of(context).aboutPageAdvantage2,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text(L10n.of(context).aboutPageAdvantage3,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text(L10n.of(context).aboutPageAdvantage4,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text(L10n.of(context).aboutPageAdvantage5,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                SizedBox(height: 20),
                Text(L10n.of(context).aboutPageTrailing,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 20),
                Text(L10n.of(context).aboutPageDisclaimer,
                    style: defaultTheme.textTheme.bodyText1
                        ?.copyWith(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify),
              ],
            ))));
  }
}
