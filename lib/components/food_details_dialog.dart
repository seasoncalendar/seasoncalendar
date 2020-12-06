import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/helpers/text_selector.dart';

class FoodDetailsDialog extends StatelessWidget {
  final String _foodDisplayName;
  final Image _foodImage;
  final List<List<Availability>> _allAvailabilities;

  FoodDetailsDialog(String foodDisplayName, Image foodImage,
      List<List<Availability>> allAvailabilities)
      : _foodDisplayName = foodDisplayName,
        _foodImage = foodImage,
        _allAvailabilities = allAvailabilities;

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    var availabilities = Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [for (var i = 0; i < 4; i += 1) getAvailabilityInfoCard(context, i)],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [for (var i = 4; i < 8; i += 1) getAvailabilityInfoCard(context, i)],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 8; i < 12; i += 1) getAvailabilityInfoCard(context, i)
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
            _foodDisplayName,
            textAlign: TextAlign.center,
            style: defaultTheme.textTheme.headline5,
          ),
          SizedBox(height: 10),
          imgAndAvailabilities,
        ],
      ),
    );
  }

  Widget getAvailabilityInfoCard(BuildContext context, int monthIndex) {
    Widget containerChild;

    int fstModeIdx = _allAvailabilities[monthIndex].indexWhere((mode) => mode != Availability.none);
    int sndModeIdx = _allAvailabilities[monthIndex].indexWhere((mode) => mode != Availability.none, fstModeIdx + 1);

    if (fstModeIdx == -1) {
      int iconAlpha = getIconAlphaFromAvailability(Availability.none);
      containerChild = Icon(
          availabilityModeIcons[fstModeIdx], color: Colors.black.withAlpha(iconAlpha));
    }

    else if (sndModeIdx == -1) {
      int iconAlpha = getIconAlphaFromAvailability(_allAvailabilities[monthIndex][fstModeIdx]);
      containerChild = Icon(
          availabilityModeIcons[fstModeIdx], color: Colors.black.withAlpha(iconAlpha));
    } else {
      int primaryIconAlpha = getIconAlphaFromAvailability(_allAvailabilities[monthIndex][fstModeIdx]);
      int secondaryIconAlpha = getIconAlphaFromAvailability(_allAvailabilities[monthIndex][sndModeIdx]);
      containerChild = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(availabilityModeIcons[fstModeIdx],
              color: Colors.black.withAlpha(primaryIconAlpha)),
          Text(" / "),
          Icon(availabilityModeIcons[sndModeIdx], color: Colors.black.withAlpha(secondaryIconAlpha)),
        ],
      );
    }

    return Expanded(
      flex: 1,
      child: Container(
        child: Card(
            elevation: 1,
            color: availabilityModeColor[fstModeIdx],
            child: Container(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: <Widget>[
                  Text(getMonthNameFromIndex(context, monthIndex).substring(0, 3),
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
