import 'package:flutter/material.dart';

import 'package:seasoncalendar/generated/l10n.dart';

class HowToPage extends StatelessWidget {
  const HowToPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).howToPageTitle)),
        body: Container(
            margin: const EdgeInsets.all(18),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Text(L10n.of(context).howToPageExplanationHeadline,
                    style: Theme.of(context).textTheme.headline4),
                const SizedBox(height: 20),
                Text(L10n.of(context).howToPageExplanation,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 10),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.home, color: Colors.black),
                  title: Text(L10n.of(context).howToPageAvLocal,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.local_shipping, color: Colors.black),
                  title: Text(L10n.of(context).howToPageAvLand,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.directions_boat, color: Colors.black),
                  title: Text(L10n.of(context).howToPageAvSea,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.airplanemode_active, color: Colors.black),
                  title: Text(L10n.of(context).howToPageAvAir,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                const SizedBox(height: 10),
                Text(L10n.of(context).howToPagePartial,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 10),
                Text(L10n.of(context).howToPageColors,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 10),
                Text(L10n.of(context).howToPageFavorites,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                const SizedBox(height: 10),
              ],
            ))));
  }
}
