import 'package:flutter/material.dart';
import 'package:seasoncalendar/models/availability.dart';
import 'package:seasoncalendar/generated/l10n.dart';


class FoodEditAvailabilities extends StatefulWidget {
  final Widget? title;
  final List<Availability> availabilities;

  const FoodEditAvailabilities(
      this.availabilities,
      { Key? key,
        this.title})
      : super(key: key);

  @override
  FoodEditAvailabilitiesState createState() => FoodEditAvailabilitiesState();
}

class FoodEditAvailabilitiesState extends State<FoodEditAvailabilities> {
  late List<bool> boolAvailabilities;

  @override
  initState() {
    super.initState();
    boolAvailabilities = availabilitiesToBooleans(widget.availabilities);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: widget.title,
      content: SingleChildScrollView(
        child: Column(
          children: [
            ToggleButtons(
                color: Colors.black38,
                selectedColor: Colors.black,
                fillColor: Theme.of(context).colorScheme.primary.withAlpha(150),
                borderColor: Theme.of(context).colorScheme.secondary.withAlpha(0),
                selectedBorderColor:
                Theme.of(context).colorScheme.secondary.withAlpha(150),
                splashColor: Theme.of(context).colorScheme.primary,
                highlightColor: Theme.of(context).colorScheme.primary,
                children: avIcons.getRange(0,4).toList(),
                isSelected: boolAvailabilities,
                onPressed: (int i) {
                  setState(() {
                    boolAvailabilities[i] = !boolAvailabilities[i];
                  });
                }),
          ],
        ),
      ),
      elevation: 0,
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/etc/howto");
          },
          child: const Icon(Icons.help),
        ),
        MaterialButton(
            onPressed: () {
              var avList = availabilitiesFromBooleans(boolAvailabilities);
              Navigator.of(context).pop(avList);
            },
            child: Text(L10n
                .of(context)
                .confirm)
        ),
      ],
    );
  }
}
