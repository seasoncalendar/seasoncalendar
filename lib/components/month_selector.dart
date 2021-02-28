import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasoncalendar/theme/themes.dart';

import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';

import 'package:seasoncalendar/models/food_display_configuration.dart';
import 'package:seasoncalendar/helpers/text_selector.dart';

class MonthSelector extends StatelessWidget {
  final FoodDisplayConfiguration _fdc;

  MonthSelector(FoodDisplayConfiguration fdc) : _fdc = fdc;

  @override
  Widget build(BuildContext context) {
    return SwipeGestureRecognizer(
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
            Container(
              child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    _fdc.shiftMonth(-1);
                  }),
            ),
            Expanded(
                child: Container(
                    child: GestureDetector(
                        child: Text(
                          getMonthNameFromIndex(context, _fdc.monthIndex),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              backgroundColor: Colors.white,
                              content: Container(
                                width: double.minPositive,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 12 * 2 - 1,
                                    // 12 months in the gregorian calendar
                                    itemBuilder: (context, i) {
                                      if (i % 2 == 0) {
                                        return ListTileTheme(
                                          selectedTileColor: defaultTheme.primaryColor,
                                          selectedColor: Colors.black,
                                          child: ListTile(
                                            title: Text(
                                              getMonthNameFromIndex(
                                                  context, (i / 2).round()),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            selected: i / 2 == _fdc.monthIndex,
                                            onTap: () {
                                              _fdc.setMonth((i / 2).round());
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        );
                                      } else {
                                        return const Divider(
                                          height: 0,
                                        );
                                      }
                                    }),
                              ),
                              elevation: 10,
                            ),
                            barrierDismissible: true,
                          );
                        }))),
            Container(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                onPressed: () {
                  _fdc.shiftMonth(1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
