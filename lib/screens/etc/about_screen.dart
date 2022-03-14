import 'package:flutter/material.dart';
import 'package:seasoncalendar/generated/l10n.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).aboutPageTitle)),
        body: Container(
            margin: const EdgeInsets.all(18),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Text(L10n.of(context).aboutPageHeadline,
                    style: Theme.of(context).textTheme.headline4),
                const SizedBox(height: 20),
                Text(L10n.of(context).aboutPageLeading,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 10),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.check, color: Colors.green),
                  title: Text(L10n.of(context).aboutPageAdvantage1,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.check, color: Colors.green),
                  title: Text(L10n.of(context).aboutPageAdvantage2,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.check, color: Colors.green),
                  title: Text(L10n.of(context).aboutPageAdvantage3,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.check, color: Colors.green),
                  title: Text(L10n.of(context).aboutPageAdvantage4,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.check, color: Colors.green),
                  title: Text(L10n.of(context).aboutPageAdvantage5,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                const SizedBox(height: 20),
                Text(L10n.of(context).aboutPageTrailing,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 20),
                Text(L10n.of(context).aboutPageDisclaimer,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify),
              ],
            ))));
  }
}
