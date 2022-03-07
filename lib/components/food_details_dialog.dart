import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seasoncalendar/helpers/text_selector.dart';
import 'package:seasoncalendar/models/availability.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_config.dart';
import '../app_data.dart';
import 'food_edit_availabilities.dart';

class FoodDetailsDialog extends StatefulWidget {
  Food _food;
  //final Image _foodImage;

  FoodDetailsDialog(Food food, {Key? key})
      : _food = food, super(key: key);

  @override
  State<StatefulWidget> createState() => FoodDetailsState();
}

class FoodDetailsState extends State<FoodDetailsDialog> {
  late List<List<Availability>> _allAvailabilities; // TODO remove and get from _food jit

  @override
  Widget build(BuildContext context) {
    widget._food = AppData.of(context).curFoods.firstWhere(
            (e) => e.id == widget._food.id);

    _allAvailabilities = widget._food.getAvailabilitiesList(short: false);
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    Widget imgAndAvailabilities;
    var regionInfo = Text(widget._food.region.name
        + (widget._food.isEdited ? " (edited)" : ""));

    if (isPortrait) {
      imgAndAvailabilities = Column(
        children: <Widget>[
          Hero(
            tag: widget._food.id,
            child: Image.asset(widget._food.assetImgPath),
          ),
          const SizedBox(height: 4),
          regionInfo,
          const SizedBox(height: 2),
          _availabilityMatrix(context),
        ],
      );
    } else {
      // isLandscape
      imgAndAvailabilities = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Image.asset(
                  widget._food.assetImgPath,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 5),
                regionInfo,
            ],
          )),
          const SizedBox(width: 5),
          Expanded(
            flex: 3,
            child: _availabilityMatrix(context),
          ),
        ],
      );
    }

    List<Widget> actions = [];

    if (AppConfig.of(context).useCustomAv) {
      actions = [ MaterialButton(
          onPressed: widget._food.isEdited
              ? () {
            AppData.of(context, listen: false).revertAvailabilities(widget._food);
          }
              : null,
          child: Text("Revert"),
      )];
    } else {
      actions = [IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                content: Text("Enable editing of availabilities?"),
                actions: [
                  MaterialButton(
                    child: Text("No"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                  MaterialButton(
                      child: Text("Yes"),
                      onPressed: () {
                        AppConfig.of(context, listen: false).useCustomAv = true;
                        Navigator.of(context).pop();
                      }),
                ]),
          );
        },
      )];
    }

    actions += [
      MaterialButton(
        onPressed: () async {
          final url = widget._food.infoUrl;
          if (await canLaunch(url)) {
            await launch(
              url,
              forceSafariVC: false,
            );
          }
        },
        child: Text(L10n.of(context).wikipedia),
      ),
      MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(L10n.of(context).back)),
    ];

    return Consumer<AppData>(
      builder: (_, data, child) { return child!; },
      child: AlertDialog(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        buttonPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FittedBox(
                child: Text(
                  widget._food.displayName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              const SizedBox(height: 10),
              imgAndAvailabilities,
            ],
          ),
        ),
        elevation: 10,
        actions: actions,
        actionsAlignment: MainAxisAlignment.spaceAround,
        // actionsPadding: EdgeInsets.symmetric(horizontal: 4),
      ),
    );
  }

  Widget _availabilityMatrix(BuildContext context) {

    var g = GridView.count(
      crossAxisCount: 3,
      children: [
        for (var i = 0; i < 12; i += 1) _availabilityInfoCard(context, i)
      ],
    );

    //return g;
    
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < 4; i += 1) _availabilityInfoCard(context, i)
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 4; i < 8; i += 1) _availabilityInfoCard(context, i)
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 8; i < 12; i += 1) _availabilityInfoCard(context, i)
          ],
        ),
      ],
    );
  }

  Widget _availabilityInfoCard(BuildContext context, int monthIndex) {
    Widget icons;

    var summaryAvs = availabilitiesSummary(_allAvailabilities[monthIndex]);

    int fstModeIdx = _allAvailabilities[monthIndex]
        .indexWhere(isAvailable);
    int sndModeIdx = _allAvailabilities[monthIndex]
        .indexWhere(isAvailable, fstModeIdx + 1);

    var isUnknown = _allAvailabilities[monthIndex].every((a) => a == Availability.unknown);

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
      int iconAlpha = getIconAlphaFromAvailability(
          _allAvailabilities[monthIndex][fstModeIdx]);
      icons = Icon(availabilityModeIcons[fstModeIdx],
          color: Colors.black.withAlpha(iconAlpha));
    } else {
      int primaryIconAlpha = getIconAlphaFromAvailability(
          _allAvailabilities[monthIndex][fstModeIdx]);
      int secondaryIconAlpha = getIconAlphaFromAvailability(
          _allAvailabilities[monthIndex][sndModeIdx]);
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
            widget._food.getAvailabilitiesList()[monthIndex],
            title: Text(L10n.of(context).settingsFilterTitle),
        ),
      );
      if (ret != null) {
        ret = ret as List<Availability>;
        setState(() {
          AppData.of(context, listen: false)
              .changeAvailability(widget._food, monthIndex, ret);
        });
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
