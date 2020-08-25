import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:seasoncalendar/helpers/themes.dart';
import 'package:url_launcher/url_launcher.dart';

class ContribPage extends StatelessWidget {
  final Map<String, dynamic> _contribPageText;
  final Map<String, dynamic> _links;

  ContribPage(Map<String, dynamic> contribPageText, Map<String, dynamic> links)
      : _contribPageText = contribPageText,
        _links = links;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_contribPageText['contribPageTitle'])),
        body: Container(
            margin: EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(_contribPageText['contribPageContactHeadline'],
                      style: defaultTheme.textTheme.headline4),
                  SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: _contribPageText['contribPageContact'],
                      style: defaultTheme.textTheme.bodyText1
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    child:
                        Text(_contribPageText['contribPageContactButtonText']),
                    onPressed: () async {
                      final url = _links['websiteContactPage'];
                      if (await canLaunch(url)) {
                        await launch(
                          url,
                          forceSafariVC: false,
                        );
                      }
                    },
                  ),
                  SizedBox(height: 50),
                  Text(_contribPageText['contribPageCodeHeadline'],
                      style: defaultTheme.textTheme.headline4),
                  SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: _contribPageText['contribPageCode'],
                      style: defaultTheme.textTheme.bodyText1
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    child: Text(_contribPageText['contribPageCodeButtonText']),
                    onPressed: () async {
                      final url = _links['seasonCalendarGithub'];
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
