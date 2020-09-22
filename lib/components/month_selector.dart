import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';

import 'package:seasoncalendar/components/food_display_configuration.dart';
import 'package:seasoncalendar/theme/seasoncalendar_icons.dart';

class MonthSelector extends StatelessWidget {
  final GlobalKey<FoodDisplayConfigurationState> _foodStateKey;

  MonthSelector(GlobalKey<FoodDisplayConfigurationState> foodStateKey)
      : _foodStateKey = foodStateKey;

  @override
  Widget build(BuildContext context) {
    return SwipeGestureRecognizer(
      onSwipeLeft: () {
        _foodStateKey.currentState.shiftMonth(1);
      },
      onSwipeRight: () {
        _foodStateKey.currentState.shiftMonth(-1);
      },
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 10,
              child: Container(
                margin: const EdgeInsets.all(2),
                color: Colors.white24,
                child: IconButton(
                    icon: const Icon(
                      SeasonCalendarIcons.arrow_left,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      _foodStateKey.currentState.shiftMonth(-1);
                    }),
              )),
          Expanded(
            flex: 20,
            child: Container(
                margin: const EdgeInsets.all(2),
                child: GestureDetector(
                    child: Text(
                      _foodStateKey.currentState.widget
                          .monthNames[_foodStateKey.currentState.monthIndex],
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
                                itemCount: _foodStateKey.currentState.widget
                                            .monthNames.length *
                                        2 -
                                    1,
                                itemBuilder: (context, i) {
                                  if (i % 2 == 0) {
                                    return ListTile(
                                      title: Text(
                                        _foodStateKey.currentState.widget
                                            .monthNames[(i / 2).round()],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onTap: () {
                                        _foodStateKey.currentState
                                            .setMonth((i / 2).round());
                                        Navigator.of(context).pop();
                                      },
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
                    })),
          ),
          Expanded(
            flex: 10,
            child: Container(
              color: Colors.white24,
              child: IconButton(
                icon: const Icon(
                  SeasonCalendarIcons.arrow_right,
                  color: Colors.black,
                ),
                onPressed: () {
                  _foodStateKey.currentState.shiftMonth(1);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
