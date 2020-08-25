import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:url_launcher/url_launcher.dart';

import 'helpers/themes.dart';
import 'food.dart';

class AdditionalInfoDialog extends StatelessWidget {
  String _foodName;
  Image _foodImage;
  String _foodInfoURL;
  List<dynamic> _monthNames;
  List<List<String>> _allAvailabilities;

  AdditionalInfoDialog(String foodName, String foodInfoURL, Image foodImage,
      List<dynamic> monthNames, List<List<String>> allAvailabilities)
      : _foodName = foodName,
        _foodImage = foodImage,
        _foodInfoURL = foodInfoURL,
        _monthNames = monthNames,
        _allAvailabilities = allAvailabilities;

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    var availabilities = Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [for (var i = 0; i < 4; i += 1) getAvailabilityInfoCard(i)],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [for (var i = 4; i < 8; i += 1) getAvailabilityInfoCard(i)],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 8; i < 12; i += 1) getAvailabilityInfoCard(i)
          ],
        ),
      ],
    );

    var imgAndAvailabilities;

    if (isPortrait) {
      imgAndAvailabilities = Column(
        children: <Widget>[_foodImage, SizedBox(height: 10), availabilities],
      );
    } else {
      imgAndAvailabilities = Row(
        children: <Widget>[
          Expanded(
            flex: 41,
            child: _foodImage,
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 100,
            child: availabilities,
          )
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(
            _foodName,
            textAlign: TextAlign.center,
            style: defaultTheme.textTheme.headline5,
          ),
          SizedBox(height: 10),
          imgAndAvailabilities,
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text('Zurück'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              RaisedButton(
                child: Text('Wikipedia'),
                onPressed: () async {
                  final url = _foodInfoURL;
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
        ],
      ),
    );
  }

  Widget getAvailabilityInfoCard(int monthIndex) {
    Widget containerChild;

    if (_allAvailabilities[monthIndex].length == 1) {
      containerChild = Icon(
          availabilityModeIcons[_allAvailabilities[monthIndex][0]],
          color: Colors.black.withAlpha(180));
    } else {
      containerChild = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(availabilityModeIcons[_allAvailabilities[monthIndex][0]],
              color: Colors.black.withAlpha(180)),
          Text(" / "),
          Icon(availabilityModeIcons[_allAvailabilities[monthIndex][1]],
              color: Colors.black.withAlpha(110)),
        ],
      );
    }

    return Expanded(
      flex: 1,
      child: Container(
        child: Card(
            elevation: 1,
            color: availabilityModeColor[_allAvailabilities[monthIndex][0]],
            child: Container(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: <Widget>[
                  Text(_monthNames[monthIndex].substring(0, 3),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: containerChild,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
