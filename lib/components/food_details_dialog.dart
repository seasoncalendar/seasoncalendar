import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seasoncalendar/components/availability_matrix.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_config.dart';
import '../app_data.dart';

class FoodDetailsDialog extends StatefulWidget {
  final Food originalFood;

  const FoodDetailsDialog(Food food, {Key? key})
      : originalFood = food, super(key: key);

  @override
  State<StatefulWidget> createState() => FoodDetailsState();
}

class FoodDetailsState extends State<FoodDetailsDialog> {

  @override
  Widget build(BuildContext context) {
    var food = AppData.of(context).curFoods.firstWhere(
            (e) => e.id == widget.originalFood.id);

    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    Widget imgAndAvailabilities;
    var regionInfo = Text(food.region.name + (food.isEdited ? " (edited)" : ""));

    if (isPortrait) {
      imgAndAvailabilities = Column(
        children: <Widget>[
          Hero(
            tag: food.id,
            child: Image.asset(food.assetImgPath),
          ),
          const SizedBox(height: 4),
          regionInfo,
          const SizedBox(height: 2),
          AvailabilityMatrix(food,
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
                  food.assetImgPath,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 5),
                regionInfo,
            ],
          )),
          const SizedBox(width: 5),
          Expanded(
            flex: 3,
            child: AvailabilityMatrix(food,
                wasEditedCallback: () => setState(() {})
            ),
          ),
        ],
      );
    }

    List<Widget> actions = [];

    if (AppConfig.of(context).useCustomAv) {
      actions = [ MaterialButton(
          onPressed: food.isEdited
              ? () {
            AppData.of(context, listen: false).revertAvailabilities(food);
          }
              : null,
          child: const Icon(Icons.delete, semanticLabel: "Reset"),
      )];
    } else {
      actions = [IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                content: Text(L10n.of(context).dialogEnableCustomAv),
                actions: [
                  MaterialButton(
                    child: Text(L10n.of(context).back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                  MaterialButton(
                      child: Text(L10n.of(context).confirm),
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
          final url = food.infoUrl;
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
                  food.displayName,
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
