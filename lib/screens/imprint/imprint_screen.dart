import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:seasoncalendar/theme/themes.dart';

class ImprintPage extends StatelessWidget {
  final Map<String, dynamic> _imprintPageText;

  ImprintPage(Map<String, dynamic> imprintPageText)
      : _imprintPageText = imprintPageText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_imprintPageText['imprintPageTitle'])),
      body: Container(
          margin: EdgeInsets.all(18),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                _imprintPageText['imprintPagePublisher'],
                style: defaultTheme.textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                _imprintPageText['imprintPageAddress'],
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              Text(
                _imprintPageText['imprintPageDisclaimerHeadline'],
                style: defaultTheme.textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                _imprintPageText['imprintPageDisclaimerText'],
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              Text(
                _imprintPageText['imprintPageDataProtectionHeadline'],
                style: defaultTheme.textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                _imprintPageText['imprintPageDataProtectionText'],
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              Text(
                _imprintPageText['imprintPageSourcesHeadline'],
                style: defaultTheme.textTheme.headline4,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                _imprintPageText['imprintPageTextHeadline'],
                style: defaultTheme.textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                _imprintPageText['imprintPageMyName'],
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              Text(
                _imprintPageText['imprintPageDataHeadline'],
                style: defaultTheme.textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                _imprintPageText['imprintPageDataText'],
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(_imprintPageText['imprintPageDataText2'],
                  textAlign: TextAlign.left,
                  style: defaultTheme.textTheme.bodyText1
                      .copyWith(fontStyle: FontStyle.italic)),
              SizedBox(height: 20),
              GestureDetector(
                child: Text(
                  _imprintPageText['imprintPageImagesHeadline'] ,
                  style: defaultTheme.textTheme.headline6.copyWith(color: defaultTheme.accentColor),
                  textAlign: TextAlign.left,
                ),
                onTap: () => Navigator.of(context).pushNamed("/imprint/imgs"),
              ),

              SizedBox(height: 10),
              Text(
                _imprintPageText['imprintPageFontsHeadline'],
                style: defaultTheme.textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                _imprintPageText['imprintPageFontsText'],
                textAlign: TextAlign.left,
              ),
            ],
          ))),
    );
  }
}
