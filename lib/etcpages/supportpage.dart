import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:seasoncalendar/helpers/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatelessWidget {

  final Map<String, dynamic> _supportPageText;
  final Map<String, dynamic> _links;

  SupportPage(Map<String, dynamic> supportPageText, Map<String, dynamic> links)
      : _supportPageText = supportPageText, _links = links;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_supportPageText['supportPageTitle'])
      ),
      body: Container(
        margin: EdgeInsets.all(18),
        child: Expanded(
          child: Column(
            children: <Widget>[
              Text(_supportPageText['supportPageHeadline'], style: font20b),
              SizedBox(height: 20),
              Text(_supportPageText['supportPageText1'], style: font18, textAlign: TextAlign.justify),
              SizedBox(height: 10),
              Text(_supportPageText['supportPageText2'], style: font18, textAlign: TextAlign.justify),
              SizedBox(height: 10),
              RaisedButton(
                child: Text(_supportPageText['supportPageWebsiteLink']),
                onPressed: () async {
                  final url = _links['websiteSupportPage'];
                  if (await canLaunch(url)) {
                    await launch(
                      url,
                      forceSafariVC: false,
                    );
                  }
                },
              ),
            ],
          )
        )
      )
    );
  }
}