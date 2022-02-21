import 'package:flutter/material.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/models/availability.dart';

class SettingsAvailabilitiesDialog extends StatefulWidget {
  final List<bool> _selectedAvailabilities;
  final Widget? title;

  const SettingsAvailabilitiesDialog(this._selectedAvailabilities,
      {Key? key, this.title})
      : super(key: key);

  List<bool> get selectedAvailabilities => _selectedAvailabilities;

  @override
  SettingsAvailabilitiesDialogState createState() => SettingsAvailabilitiesDialogState();
}

class SettingsAvailabilitiesDialogState extends State<SettingsAvailabilitiesDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title,
      elevation: 10,
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
                children: avIcons,
                isSelected: widget._selectedAvailabilities,
                onPressed: (int i) {
                  setState(() {
                    widget._selectedAvailabilities[i] = !widget._selectedAvailabilities[i];
                  });
                }),

          ],
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/etc/howto");
          },
          child: const Icon(Icons.help),
        ),
        MaterialButton(
            onPressed: () {
              Navigator.of(context).pop(widget._selectedAvailabilities);
            },
            child: Text(L10n.of(context).confirm)),
      ],
    );
  }
}
