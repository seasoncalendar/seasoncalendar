import 'package:flutter/material.dart';
import 'package:seasoncalendar/models/food_display_configuration.dart';
import 'package:seasoncalendar/helpers/text_selector.dart';
import 'package:swipe/swipe.dart';

class MonthSelector extends StatelessWidget {
  final FoodDisplayConfiguration _fdc;

  const MonthSelector(FoodDisplayConfiguration fdc, {Key? key}) : _fdc = fdc, super(key: key);

  Widget monthDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        width: double.minPositive,
        child: ListView.builder(
            itemCount: 12 * 2 - 1,
            // 12 months in the gregorian calendar + dividers
            itemBuilder: (context, i) {
              if (i % 2 != 0) {
                return const Divider(height: 0);
              }
              int monthIndex = (i / 2).round();
              return ListTileTheme(
                selectedTileColor: Theme.of(context).colorScheme.primary,
                selectedColor: Colors.black,
                child: ListTile(
                  title: Text(
                    getMonthNameFromIndex(context, monthIndex),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: monthIndex == _fdc.monthIndex,
                  onTap: () {
                    _fdc.setMonth(monthIndex);
                    Navigator.of(context).pop();
                  },
                ),
              );
            }),
      ),
      elevation: 10,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Swipe(
      onSwipeLeft: () {
        _fdc.shiftMonth(1);
      },
      onSwipeRight: () {
        _fdc.shiftMonth(-1);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
                onPressed: () {
                  _fdc.shiftMonth(-1);
                }),
            Expanded(
                child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        getMonthNameFromIndex(context, _fdc.monthIndex),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: monthDialog,
                        barrierDismissible: true,
                      );
                    })),
            IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onPressed: () {
                _fdc.shiftMonth(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
