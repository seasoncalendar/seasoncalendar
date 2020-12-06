import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/helpers/availabilities.dart';

class FilterfoodsDialog extends StatefulWidget {
  List<bool> _selectedAvailabilities;

  FilterfoodsDialog(List<bool> selectedAvailabilities)
      : _selectedAvailabilities = selectedAvailabilities;

  @override
  FilterfoodsDialogState createState() => new FilterfoodsDialogState();
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
            style: defaultTheme.textTheme.headline5,
          ),
          SizedBox(height: 35,),
          ToggleButtons(
            color: Colors.black38,
            selectedColor: Colors.black,
            fillColor: defaultTheme.primaryColor.withAlpha(150),
            borderColor: defaultTheme.accentColor.withAlpha(0),
            selectedBorderColor: defaultTheme.accentColor.withAlpha(150),
            splashColor: defaultTheme.primaryColor,
            highlightColor: defaultTheme.primaryColor,
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
