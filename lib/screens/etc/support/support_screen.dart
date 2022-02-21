import 'package:flutter/material.dart';
import 'package:seasoncalendar/app_config.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:seasoncalendar/generated/l10n.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _l10nIndependentText = AppConfig.of(context).independentText;

    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).supportPageTitle)),
        body: Container(
            margin: const EdgeInsets.all(18),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Text(L10n.of(context).supportPageSpreadTitle,
                    style: Theme.of(context).textTheme.headline4),
                const SizedBox(height: 20),
                Text(L10n.of(context).supportPageSpreadText1,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 10),
                Text(L10n.of(context).supportPageSpreadText2,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 10),
                Text(L10n.of(context).supportPageHeadline,
                    style: Theme.of(context).textTheme.headline4),
                const SizedBox(height: 20),
                Text(L10n.of(context).supportPageText1,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 10),
                Text(L10n.of(context).supportPageText2,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 10),
                ElevatedButton(
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
