import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/l10n/app_localizations.dart';

class ImprintPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).imprintPageTitle)),
      body: Container(
          margin: EdgeInsets.all(18),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).imprintPagePublisher,
                style: defaultTheme.textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                AppLocalizations.of(context).imprintPageAddress,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              Text(
                AppLocalizations.of(context).imprintPageDisclaimerHeadline,
                style: defaultTheme.textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                AppLocalizations.of(context).imprintPageDisclaimerText,
                textAlign: TextAlign.justify
              ),
              SizedBox(height: 20),
              Text(
                AppLocalizations.of(context).imprintPageDataProtectionHeadline,
                style: defaultTheme.textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                AppLocalizations.of(context).imprintPageDataProtectionText,
                textAlign: TextAlign.justify
              ),
              SizedBox(height: 20),
              Text(
                AppLocalizations.of(context).imprintPageSourcesHeadline,
                style: defaultTheme.textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                AppLocalizations.of(context).imprintPageTextHeadline,
                style: defaultTheme.textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                AppLocalizations.of(context).imprintPageMyName,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              Text(
                AppLocalizations.of(context).imprintPageDataHeadline,
                style: defaultTheme.textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                AppLocalizations.of(context).imprintPageDataText,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(AppLocalizations.of(context).imprintPageDataText2,
                  textAlign: TextAlign.left,
                  style: defaultTheme.textTheme.bodyText1
                      .copyWith(fontStyle: FontStyle.italic)),
              SizedBox(height: 20),
              GestureDetector(
                child: Text(
                  AppLocalizations.of(context).imprintPageImagesHeadline ,
                  style: defaultTheme.textTheme.headline6.copyWith(color: defaultTheme.accentColor),
                  textAlign: TextAlign.left,
                ),
                onTap: () => Navigator.of(context).pushNamed("/etc/imprint/imgs"),
              ),

              SizedBox(height: 10),
              Text(
                AppLocalizations.of(context).imprintPageFontsHeadline,
                style: defaultTheme.textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                AppLocalizations.of(context).imprintPageFontsText,
                textAlign: TextAlign.left,
              ),
            ],
          ))),
    );
  }
}
