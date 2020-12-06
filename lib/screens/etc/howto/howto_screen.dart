import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/generated/l10n.dart';

class HowToPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).howToPageTitle)),
        body: Container(
            margin: EdgeInsets.all(18),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Text(L10n.of(context).howToPageExplanationHeadline,
                    style: defaultTheme.textTheme.headline4),
                SizedBox(height: 20),
                Text(L10n.of(context).howToPageExplanation,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.home, color: Colors.black),
                  title: Text(L10n.of(context).howToPageAvLocal,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.local_shipping, color: Colors.black),
                  title: Text(L10n.of(context).howToPageAvLand,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.directions_boat, color: Colors.black),
                  title: Text(L10n.of(context).howToPageAvSea,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(Icons.airplanemode_active, color: Colors.black),
                  title: Text(L10n.of(context).howToPageAvAir,
                      style: defaultTheme.textTheme.bodyText1),
                ),
                SizedBox(height: 10),
                Text(L10n.of(context).howToPagePartial,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                Text(L10n.of(context).howToPageColors,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                Text(L10n.of(context).howToPageFavorites,
                    style: defaultTheme.textTheme.bodyText1,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
              ],
            ))));
  }
}
