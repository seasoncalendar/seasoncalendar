import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/generated/l10n.dart';

class ImprintPage extends StatelessWidget {

  final Map<String, dynamic> _l10nIndependentText;

  ImprintPage(Map<String, dynamic> l10nIndependentText)
      : _l10nIndependentText = l10nIndependentText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.of(context).imprintPageTitle)),
      body: Container(
          margin: EdgeInsets.all(18),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                L10n.of(context).imprintPagePublisher,
                style: defaultTheme.textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                  _l10nIndependentText["developerAddress"],
                  textAlign: TextAlign.left
              ),
              SizedBox(height: 20),
              Text(
                L10n.of(context).imprintPageDisclaimerHeadline,
                style: defaultTheme.textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(L10n.of(context).imprintPageDisclaimerText,
                  textAlign: TextAlign.justify),
              SizedBox(height: 20),
              Text(
                L10n.of(context).imprintPageDataProtectionHeadline,
                style: defaultTheme.textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(L10n.of(context).imprintPageDataProtectionText,
                  textAlign: TextAlign.justify),
              SizedBox(height: 20),
              Text(
                L10n.of(context).imprintPageSourcesHeadline,
                style: defaultTheme.textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                L10n.of(context).imprintPageTextHeadline,
                style: defaultTheme.textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                L10n.of(context).imprintPageMyName,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              Text(
                L10n.of(context).imprintPageDataHeadline,
                style: defaultTheme.textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                L10n.of(context).imprintPageDataText,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(L10n.of(context).imprintPageDataText2,
                  textAlign: TextAlign.left,
                  style: defaultTheme.textTheme.bodyText1
                      .copyWith(fontStyle: FontStyle.italic)),
              SizedBox(height: 20),
              GestureDetector(
                child: Text(
                  L10n.of(context).imprintPageImagesHeadline,
                  style: defaultTheme.textTheme.headline6
                      .copyWith(color: defaultTheme.accentColor),
                  textAlign: TextAlign.left,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed("/etc/imprint/imgs"),
              ),
              SizedBox(height: 10),
              Text(
                L10n.of(context).imprintPageFontsHeadline,
                style: defaultTheme.textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                L10n.of(context).imprintPageFontsText,
                textAlign: TextAlign.left,
              ),
            ],
          ))),
    );
  }
}
