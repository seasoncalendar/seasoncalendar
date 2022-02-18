import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/helpers/availabilities.dart';

class FilterfoodsDialog extends StatefulWidget {
  final List<bool> _selectedAvailabilities;

  FilterfoodsDialog(List<bool> selectedAvailabilities, {Key? key})
      : _selectedAvailabilities = selectedAvailabilities, super(key: key);

  @override
  FilterfoodsDialogState createState() => FilterfoodsDialogState();
}

class FilterfoodsDialogState extends State<FilterfoodsDialog> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            L10n.of(context).settingsFilterTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 35,
          ),
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
                toggleAvView(i);
              }),
        ],
      ),
    );
  }

  toggleAvView(int i) async {
    setState(() {
      widget._selectedAvailabilities[i] = !widget._selectedAvailabilities[i];
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(avSettingsKeys[i], widget._selectedAvailabilities[i]);
  }
}
