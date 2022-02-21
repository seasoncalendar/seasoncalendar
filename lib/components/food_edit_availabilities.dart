import 'package:flutter/material.dart';
import 'package:seasoncalendar/models/availability.dart';

class FoodEditAvailabilities extends StatefulWidget {
  final List<bool> _selectedAvailabilities;

  const FoodEditAvailabilities(this._selectedAvailabilities, {Key? key})
      : super(key: key);

  List<bool> get selectedAvailabilities => _selectedAvailabilities;

  @override
  FoodEditAvailabilitiesState createState() => FoodEditAvailabilitiesState();
}

class FoodEditAvailabilitiesState extends State<FoodEditAvailabilities> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              children: avIcons,
              isSelected: widget._selectedAvailabilities,
              onPressed: (int i) {
                setState(() {
                  widget._selectedAvailabilities[i] = !widget._selectedAvailabilities[i];
                });
              }),
        ],
      ),
    );
  }
}
