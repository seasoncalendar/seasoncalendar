import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:seasoncalendar/helpers/styles.dart';

final String supportText1 = "Für diese App wird es weder irgendwelche"
  " Bezahlfeatures geben, noch werde ich irgendwelche Werbung platzieren."
  " Diese App ist und bleibt von meiner Seite aus kostenlos für dich.";

final String supportText2 = "Du kannst mir aber gerne eine kleine Spende da"
  " lassen! Das Geld wird effizient zur Steigerung der Arbeitsmoral verwendet,"
  " z.B. indem frisches Saisonobst gekauft wird und bei der Arbeit an"
  " diesem oder anderen Projekten verzehrt wird.";

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
                  ],
                )
            )
        )
    );
  }
}