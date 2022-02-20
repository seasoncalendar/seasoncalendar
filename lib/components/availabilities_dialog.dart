import 'package:flutter/material.dart';
import 'package:seasoncalendar/screens/settings/settings_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/helpers/availabilities.dart';

class AvailabilitiesDialog extends StatefulWidget {
  final List<bool> _selectedAvailabilities;

  const AvailabilitiesDialog(this._selectedAvailabilities, {Key? key})
      : super(key: key);

  List<bool> get selectedAvailabilities => _selectedAvailabilities;

  @override
  AvailabilitiesDialogState createState() => AvailabilitiesDialogState();
}

class AvailabilitiesDialogState extends State<AvailabilitiesDialog> {
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
