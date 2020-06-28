import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:seasoncalendar/helpers/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:seasoncalendar/helpers/links.dart';

final String contribContact = "Diese App ist noch sehr jung und kann noch"
  " Fehler enthalten bzw. in sehr viele Richtungen erweitert werden. Wenn"
  " du einen Fehler gefunden hast oder einen Verbesserungsvorschlag hast,"
  " kontaktiere mich gerne über meine Website.";

final String contribCode = "Der Quellcode dieser App ist auf GitHub"
    " verfügbar.";

class ContributePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Beitragen")
      ),
      body: Container(
        margin: EdgeInsets.all(18),
          child: Column(
            children: <Widget>[
              Text("Etwas fehlt dir oder ist falsch?", style: font20b),
              SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: contribContact,
                  style: font18.copyWith(color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text("Zur Website"),
                onPressed: () async {
                  final url = websiteContactForm;
                  if (await canLaunch(url)) {
                    await launch(
                      url,
                      forceSafariVC: false,
                    );
                  }
                },
              ),
              SizedBox(height: 50),
              Text("Zeig mir den Code!", style: font20b),
              SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: contribCode,
                  style: font18.copyWith(color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text("Zum GitHub-Repo"),
                onPressed: () async {
                  final url = seasonCalendarGithub;
                  if (await canLaunch(url)) {
                    await launch(
                      url,
                      forceSafariVC: false,
                    );
                  }
                },
              )
            ],
          )
        )
    );
  }
}