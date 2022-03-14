import 'package:flutter/material.dart';

import '../app_config.dart';
import '../app_data.dart';
import '../generated/l10n.dart';
import '../helpers/text_selector.dart';
import '../models/availability.dart';
import '../models/food.dart';
import 'food_edit_availabilities.dart';

class AvailabilityMatrix extends StatelessWidget {
  final Food food;
  final Function? wasEditedCallback;

  const AvailabilityMatrix(this.food, {this.wasEditedCallback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var allAvailabilities = food.getAvailabilitiesList(short: false);

    /*
    var g = GridView.count(
      crossAxisCount: 4,
      children: [
        for (var i = 0; i < 12; i += 1) _availabilityInfoCard(context, i)
      ],
    );

    return g;
     */

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < 4; i += 1) _availabilityInfoCard(context, allAvailabilities[i], i)
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 4; i < 8; i += 1) _availabilityInfoCard(context, allAvailabilities[i], i)
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 8; i < 12; i += 1) _availabilityInfoCard(context, allAvailabilities[i], i)
          ],
        ),
      ],
    );
  }

  Widget _availabilityInfoCard(BuildContext context, List<Availability> avs, int monthIndex) {
    Widget icons;

    // TODO use summary
    // var summaryAvs = availabilitiesSummary(avs);

    int fstModeIdx = avs.indexWhere(isAvailable);
    int sndModeIdx = avs.indexWhere(isAvailable, fstModeIdx + 1);

    var isUnknown = avs.every((a) => a == Availability.unknown);

    if (fstModeIdx == -1 && isUnknown) {
      fstModeIdx = 4;
      int iconAlpha = getIconAlphaFromAvailability(Availability.unknown);
      icons = Icon(availabilityModeIcons[fstModeIdx],
          color: Colors.black.withAlpha(iconAlpha));
    } else if (fstModeIdx == -1) {
      int iconAlpha = getIconAlphaFromAvailability(Availability.none);
      icons = Icon(availabilityModeIcons[fstModeIdx],
          color: Colors.black.withAlpha(iconAlpha));
    } else if (sndModeIdx == -1) {
      int iconAlpha = getIconAlphaFromAvailability(avs[fstModeIdx]);
      icons = Icon(availabilityModeIcons[fstModeIdx],
          color: Colors.black.withAlpha(iconAlpha));
    } else {
      int primaryIconAlpha = getIconAlphaFromAvailability(avs[fstModeIdx]);
      int secondaryIconAlpha = getIconAlphaFromAvailability(avs[sndModeIdx]);
      icons = Row(
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
      var ret = await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => FoodEditAvailabilities(
          avs,
          title: Text(L10n.of(context).settingsFilterTitle),
        ),
      );
      if (ret != null) {
        ret = ret as List<Availability>;
          AppData.of(context, listen: false)
              .changeAvailability(food, monthIndex, ret);
          if (wasEditedCallback != null) wasEditedCallback!();
      }
    }

    return Expanded(
      flex: 1,
      child: Card(
        elevation: 1.5,
        color: availabilityModeColor[fstModeIdx],
        child: InkWell(
          onTap: allowEditAvailabilities ? editAvailabilities : null,
          child: Container(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: <Widget>[
                Text(getMonthNameFromIndex(context, monthIndex).substring(0, 3),
                    style: const TextStyle(fontWeight: FontWeight.bold)
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: icons,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}