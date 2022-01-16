import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/generated/l10n.dart';

class ContribPage extends StatelessWidget {

  final Map<String, dynamic> _l10nIndependentText;

  ContribPage(Map<String, dynamic> l10nIndependentText)
      : _l10nIndependentText = l10nIndependentText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).contribPageTitle)),
        body: Container(
            margin: EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(L10n.of(context).contribPageContactHeadline,
                      style: defaultTheme.textTheme.headline4),
                  SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: L10n.of(context).contribPageContact,
                      style: defaultTheme.textTheme.bodyText1
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    child:
                        Text(L10n.of(context).contribPageContactButtonText),
                    onPressed: () async {
                      final url = _l10nIndependentText["websiteContactPage"];
                      if (await canLaunch(url)) {
                        await launch(
                          url,
                          forceSafariVC: false,
                        );
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Text(L10n.of(context).contribPageCodeHeadline,
                      style: defaultTheme.textTheme.headline4),
                  SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: L10n.of(context).contribPageCode,
                      style: defaultTheme.textTheme.bodyText1
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    child: Text(L10n.of(context).contribPageCodeButtonText),
                    onPressed: () async {
                      final url = _l10nIndependentText["seasonCalendarGithub"];
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
