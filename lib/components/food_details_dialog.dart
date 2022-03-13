import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seasoncalendar/components/availability_matrix.dart';
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

  @override
  Widget build(BuildContext context) {
    widget._food = AppData.of(context).curFoods.firstWhere(
            (e) => e.id == widget._food.id);

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
          AvailabilityMatrix(widget._food,
              wasEditedCallback: () => setState(() {})),
        ]
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
            child: AvailabilityMatrix(widget._food,
                wasEditedCallback: () => setState(() {})
            ),
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

}
