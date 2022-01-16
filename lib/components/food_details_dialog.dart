import 'package:flutter/material.dart';
import 'package:seasoncalendar/helpers/text_selector.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/theme/themes.dart';

class FoodDetailsDialog extends StatefulWidget {
  final Food _food;
  final Image _foodImage;
  final List<List<Availability>> _allAvailabilities;

  FoodDetailsDialog(Food food, Image foodImage, dynamic allAvailabilities)
      : _food = food,
        _foodImage = foodImage,
        _allAvailabilities = allAvailabilities;

  @override
  State<StatefulWidget> createState() => new FoodDetailsState();
}

class FoodDetailsState extends State<FoodDetailsDialog> {
  bool editing = false;

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
    var regionInfo = Text(widget._food.region.name);
    //Text(L10n.of(context). widget._food.region.name)

    if (isPortrait) {
      imgAndAvailabilities = Column(
        children: <Widget>[
          widget._foodImage, SizedBox(height: 10),
          SizedBox(width: 5),
          regionInfo,
          SizedBox(width: 5),
          availabilities,
        ],
      );
    } else { // isLandscape
      imgAndAvailabilities = Row(
        children: <Widget>[
          Expanded(
            flex: 41,
            child: widget._foodImage,
          ),
          SizedBox(width: 5),
          regionInfo,
          SizedBox(width: 5),
          Expanded(
            flex: 100,
            child: availabilities,
          ),
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(
            widget._food.displayName,
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

    int fstModeIdx = widget._allAvailabilities[monthIndex].indexWhere((
        mode) => mode != Availability.none);
    int sndModeIdx = widget._allAvailabilities[monthIndex].indexWhere((
        mode) => mode != Availability.none, fstModeIdx + 1);

    if (fstModeIdx == -1) {
      int iconAlpha = getIconAlphaFromAvailability(Availability.none);
      containerChild = Icon(
          availabilityModeIcons[fstModeIdx],
          color: Colors.black.withAlpha(iconAlpha));
    }

    else if (sndModeIdx == -1) {
      int iconAlpha = getIconAlphaFromAvailability(
          widget._allAvailabilities[monthIndex][fstModeIdx]);
      containerChild = Icon(
          availabilityModeIcons[fstModeIdx],
          color: Colors.black.withAlpha(iconAlpha));
    } else {
      int primaryIconAlpha = getIconAlphaFromAvailability(
          widget._allAvailabilities[monthIndex][fstModeIdx]);
      int secondaryIconAlpha = getIconAlphaFromAvailability(
          widget._allAvailabilities[monthIndex][sndModeIdx]);
      containerChild = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(availabilityModeIcons[fstModeIdx],
              color: Colors.black.withAlpha(primaryIconAlpha)),
          Text(" / "),
          Icon(availabilityModeIcons[sndModeIdx],
              color: Colors.black.withAlpha(secondaryIconAlpha)),
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
                  Text(getMonthNameFromIndex(context, monthIndex).substring(
                      0, 3),
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