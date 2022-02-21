import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/helpers/text_selector.dart';
import 'package:seasoncalendar/helpers/user_db_provider.dart';
import 'package:seasoncalendar/models/availability.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/models/food_display_configuration.dart';
import '../app_config.dart';
import 'availabilities_dialog.dart';

class FoodDetailsDialog extends StatefulWidget {
  final Food _food;
  final Image _foodImage;
  late List<List<Availability>> _allAvailabilities; // TODO remove and get from _food jit

  FoodDetailsDialog(Food food, Image foodImage, {Key? key})
      : _food = food,
        _foodImage = foodImage,
        super(key: key) {
    _allAvailabilities = food.getAvailabilitiesList(short: true);
  }

  @override
  State<StatefulWidget> createState() => FoodDetailsState();
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
          children: [
            for (var i = 0; i < 4; i += 1) getAvailabilityInfoCard(context, i)
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 4; i < 8; i += 1) getAvailabilityInfoCard(context, i)
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 8; i < 12; i += 1) getAvailabilityInfoCard(context, i)
          ],
        ),
      ],
    );

    Widget imgAndAvailabilities;
    var regionInfo = Text(widget._food.region.name);
    //Text(L10n.of(context). widget._food.region.name)

    if (isPortrait) {
      imgAndAvailabilities = Column(
        children: <Widget>[
          widget._foodImage,
          const SizedBox(height: 10),
          const SizedBox(width: 5),
          regionInfo,
          const SizedBox(width: 5),
          availabilities,
        ],
      );
    } else {
      // isLandscape
      imgAndAvailabilities = Row(
        children: <Widget>[
          Expanded(
            flex: 41,
            child: widget._foodImage,
          ),
          const SizedBox(width: 5),
          regionInfo,
          const SizedBox(width: 5),
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
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 10),
          imgAndAvailabilities,
        ],
      ),
    );
  }

  Widget getAvailabilityInfoCard(BuildContext context, int monthIndex) {
    Widget containerChild;

    int fstModeIdx = widget._allAvailabilities[monthIndex]
        .indexWhere((mode) => mode != Availability.none);
    int sndModeIdx = widget._allAvailabilities[monthIndex]
        .indexWhere((mode) => mode != Availability.none, fstModeIdx + 1);

    if (fstModeIdx == -1) {
      int iconAlpha = getIconAlphaFromAvailability(Availability.none);
      containerChild = Icon(availabilityModeIcons[fstModeIdx],
          color: Colors.black.withAlpha(iconAlpha));
    } else if (sndModeIdx == -1) {
      int iconAlpha = getIconAlphaFromAvailability(
          widget._allAvailabilities[monthIndex][fstModeIdx]);
      containerChild = Icon(availabilityModeIcons[fstModeIdx],
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
          const Text(" / "),
          Icon(availabilityModeIcons[sndModeIdx],
              color: Colors.black.withAlpha(secondaryIconAlpha)),
        ],
      );
    }

    var allowEditAvailabilities = AppConfig.of(context).useCustomAv;
    editAvailabilities() async {
      List<Availability> avs = widget._food.getAvailabilitiesList()[monthIndex];
      List<bool> list = availabilitiesToBooleans(avs);

      var dialog = AvailabilitiesDialog(List.of(list));
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.white,
          title: Text(L10n.of(context).settingsFilterTitle),
          content: dialog,
          elevation: 10,
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/etc/howto");
              },
              child: const Icon(Icons.help),
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop(dialog.selectedAvailabilities);
                },
                child: Text(L10n.of(context).confirm)),
          ],
        ),
        barrierDismissible: true,
      ).then((ret) {
        var retList = ret as List<bool>;
        if (!listEquals(list, retList)) {
          List<Availability> avList = availabilitiesFromBooleans(retList);
          setState(() {
            widget._food.changeAvailabilitiesForMonth(avList, monthIndex);
            widget._allAvailabilities = widget._food.getAvailabilitiesList(short: true);
            UserDBProvider.db.addCustomAvailability(widget._food);
          });
        }
      });
    }

    return Expanded(
      flex: 1,
      child: InkWell(
        child: Card(
            elevation: 1,
            color: availabilityModeColor[fstModeIdx],
            child: Container(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: <Widget>[
                  Text(
                      getMonthNameFromIndex(context, monthIndex)
                          .substring(0, 3),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: containerChild,
                  ),
                ],
              ),
            )),
        onTap: allowEditAvailabilities ? editAvailabilities : null
      ),
    );
  }
}
