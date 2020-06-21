import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:seasoncalendar/helpers/styles.dart';

final String aboutLeading = "Heutzutage sind nahezu alle Lebensmittel das ganze"
  " Jahr über verfügbar, sodass sich viele Menschen nicht mehr der Saisonzeiten"
  " von Obst, Gemüse und Co. bewusst sind. Dabei lohnt es sich oft, diese"
  " Lebensmittel dann zu kaufen wenn sie Saison haben:";

final List<String> aboutAdvantages = [
  "Frische Ernte schmeckt besser und ist gesünder.",
  "Der Preis ist deutlich niedriger.",
  "Die Lagerung ist weniger aufwendig.",
  "Beim Transport werden weniger Schadstoffe ausgestoßen.",
  "Lokale Arbeitsplätze werden gefördert."
];

final String aboutTrailing = "Diese App hilft dir dabei, dass du günstiger und"
  " leckerer isst und ein Bewusstsein für die Herkunft deines Essens aufbaust.";

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Über die App")
      ),
      body: Container(
        margin: EdgeInsets.all(18),
        child: Expanded(
          child: Column(
            children: <Widget>[
              Text("Warum auf die Saison achten?", style: font20b),
              SizedBox(height: 20),
              Text(aboutLeading, style: font18, textAlign: TextAlign.justify),
              SizedBox(height: 10),
              ListTile(
                dense: true,
                leading: Icon(Icons.check, color: Colors.green),
                title: Text(aboutAdvantages[0], style: font18),
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.check, color: Colors.green),
                title: Text(aboutAdvantages[1], style: font18),
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.check, color: Colors.green),
                title: Text(aboutAdvantages[2], style: font18),
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.check, color: Colors.green),
                title: Text(aboutAdvantages[3], style: font18),
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.check, color: Colors.green),
                title: Text(aboutAdvantages[4], style: font18),
              ),
              SizedBox(height: 20),
              Text(aboutTrailing, style: font18, textAlign: TextAlign.justify),
            ],
          )
        )
      )
    );
  }
}