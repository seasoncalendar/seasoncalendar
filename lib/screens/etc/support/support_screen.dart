import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:seasoncalendar/generated/l10n.dart';

class SupportPage extends StatelessWidget {
  final Map<String, dynamic> _l10nIndependentText;

  SupportPage(Map<String, dynamic> l10nIndependentText)
      : _l10nIndependentText = l10nIndependentText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).supportPageTitle)),
        body: Container(
            margin: EdgeInsets.all(18),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Text(L10n.of(context).supportPageSpreadTitle,
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(height: 20),
                Text(L10n.of(context).supportPageSpreadText1,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                Text(L10n.of(context).supportPageSpreadText2,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                Text(L10n.of(context).supportPageHeadline,
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(height: 20),
                Text(L10n.of(context).supportPageText1,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                Text(L10n.of(context).supportPageText2,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                RaisedButton(
                  child: Text(L10n.of(context).supportPageWebsiteLink),
                  onPressed: () async {
                    final url = _l10nIndependentText["websiteSupportPage"];
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
