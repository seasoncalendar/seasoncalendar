import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:seasoncalendar/helpers/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:seasoncalendar/helpers/links.dart';

final String contribContact = "Diese App ist noch sehr jung und kann noch"
  " Fehler enthalten bzw. in sehr viele Richtungen erweitert werden. Wenn"
  " du einen Fehler gefunden hast oder einen Verbesserungsvorschlag hast,"
  " kontaktiere mich gerne über ";

final String contribWebsiteContact = "meine Website.";

final String contribCode1 = "Der Quellcode dieser App ist auf ";
final String contribCode2 = "GitHub";
final String contribCode3 = " verfügbar.";

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
                  children: [
                    TextSpan(
                      text: contribContact,
                      style: font18.copyWith(color: Colors.black),
                    ),
                    TextSpan(
                      text: contribWebsiteContact,
                      style: font18link,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          final url = websiteContactForm;
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              forceSafariVC: false,
                            );
                          }
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("Zeig mir den Code!", style: font20b),
              SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: contribCode1,
                      style: font18.copyWith(color: Colors.black),
                    ),
                    TextSpan(
                      text: contribCode2,
                      style: font18link,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          final url = seasonCalendarGithub;
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              forceSafariVC: false,
                            );
                          }
                        },
                    ),
                    TextSpan(
                      text: contribCode3,
                      style: font18.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          )
        )
    );
  }
}