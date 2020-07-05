import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:seasoncalendar/helpers/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:seasoncalendar/helpers/links.dart';


final String supportText1 = "Für diese App wird es weder irgendwelche"
    " Bezahlfeatures geben, noch werde ich irgendwelche Werbung platzieren."
    " Diese App ist und bleibt von meiner Seite aus kostenlos für dich.";

final String supportText2 = "Du kannst aber gerne meine"
    " Arbeit unterstützen! Gehe hierzu auf meine Website, wenn du mir eine"
    " Zuwendung da lassen möchtest.";

class SupportPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Unterstützen")
        ),
        body: Container(
            margin: EdgeInsets.all(18),
            child: Expanded(
                child: Column(
                  children: <Widget>[
                    Text("Möchtest du mich unterstützen?", style: font20b),
                    SizedBox(height: 20),
                    Text(supportText1, style: font18, textAlign: TextAlign.justify),
                    SizedBox(height: 10),
                    Text(supportText2, style: font18, textAlign: TextAlign.justify),
                    SizedBox(height: 10),
                    RaisedButton(
                      child: Text("Zur Website"),
                      onPressed: () async {
                        final url = websiteSupportPage;
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