import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:seasoncalendar/helpers/styles.dart';

class AboutPage extends StatelessWidget {

  final Map<String, dynamic> _aboutPageText;

  AboutPage(Map<String, dynamic> aboutPageText) : _aboutPageText = aboutPageText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_aboutPageText['aboutPageTitle'])
      ),
      body: Container(
        margin: EdgeInsets.all(18),
        child: Expanded(
          child: Column(
            children: <Widget>[
              Text(_aboutPageText['aboutPageHeadline'], style: font20b),
              SizedBox(height: 20),
              Text(_aboutPageText['aboutPageLeading'], style: font18, textAlign: TextAlign.justify),
              SizedBox(height: 10),
              ListTile(
                dense: true,
                leading: Icon(Icons.check, color: Colors.green),
                title: Text(_aboutPageText['aboutPageAdvantages'][0], style: font18),
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.check, color: Colors.green),
                title: Text(_aboutPageText['aboutPageAdvantages'][1], style: font18),
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.check, color: Colors.green),
                title: Text(_aboutPageText['aboutPageAdvantages'][2], style: font18),
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.check, color: Colors.green),
                title: Text(_aboutPageText['aboutPageAdvantages'][3], style: font18),
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.check, color: Colors.green),
                title: Text(_aboutPageText['aboutPageAdvantages'][4], style: font18),
              ),
              SizedBox(height: 20),
              Text(_aboutPageText['aboutPageTrailing'], style: font18, textAlign: TextAlign.justify),
              SizedBox(height: 20),
              Text(_aboutPageText['aboutPageDisclaimer'], style: font18i, textAlign: TextAlign.justify),
            ],
          )
        )
      )
    );
  }
}