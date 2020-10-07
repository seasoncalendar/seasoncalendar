import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/l10n/app_localizations.dart';

class ContribPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context).contribPageTitle)),
        body: Container(
            margin: EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(AppLocalizations.of(context).contribPageContactHeadline,
                      style: defaultTheme.textTheme.headline4),
                  SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: AppLocalizations.of(context).contribPageContact,
                      style: defaultTheme.textTheme.bodyText1
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    child:
                        Text(AppLocalizations.of(context).contribPageContactButtonText),
                    onPressed: () async {
                      final url = AppLocalizations.of(context).websiteContactPage;
                      if (await canLaunch(url)) {
                        await launch(
                          url,
                          forceSafariVC: false,
                        );
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Text(AppLocalizations.of(context).contribPageCodeHeadline,
                      style: defaultTheme.textTheme.headline4),
                  SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: AppLocalizations.of(context).contribPageCode,
                      style: defaultTheme.textTheme.bodyText1
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    child: Text(AppLocalizations.of(context).contribPageCodeButtonText),
                    onPressed: () async {
                      final url = AppLocalizations.of(context).seasonCalendarGithub;
                      if (await canLaunch(url)) {
                        await launch(
                          url,
                          forceSafariVC: false,
                        );
                      }
                    },
                  )
                ],
              ),
            )));
  }
}
