import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/models/food_display_configuration.dart';
import 'package:seasoncalendar/components/food_tile.dart';

class FoodView extends StatelessWidget {
  final List<Food> _foodsToDisplay;
  final int _monthIndex;
  final List<dynamic> _monthNames;
  final String _viewContext;

  FoodView(FoodDisplayConfiguration fdc)
      : _foodsToDisplay = fdc.foodsToDisplay,
        _monthIndex = fdc.monthIndex,
        _monthNames = fdc.monthNames,
        _viewContext = fdc.favoritesSelected ? "fav" : "main";

  FoodView.fromSearchResult(
      List<Food> searchResultFoods, int monthIndex, List<dynamic> monthNames)
      : _foodsToDisplay = searchResultFoods,
        _monthIndex = monthIndex,
        _monthNames = monthNames,
        _viewContext = "search";

  @override
  Widget build(BuildContext context) {
    if (_foodsToDisplay.length < 1) {
      return _buildEmpty(_viewContext);
    }
    return GridView.builder(
      itemCount: _foodsToDisplay.length,
      padding: const EdgeInsets.all(5.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
      ),
      itemBuilder: (context, i) {
        return FoodTile(_foodsToDisplay[i], _monthIndex, _monthNames);
      },
    );
  }

  Widget _buildEmpty(String viewContext) {
    IconData emptyIcon = Icons.spa;
    String emptyText = "keine Lebensmittel verfügbar!";
    Widget favAddHint = Container();

    if (viewContext.startsWith("fav")) {
      emptyIcon = Icons.star_border;
      emptyText = "keine Favoriten verfügbar!";
      favAddHint = Text(
        "Füge deine Lieblingssorten durch\nTipp auf den jeweiligen Stern \u2606 hinzu.",
        style: const TextStyle(color: Colors.black54),
        textAlign: TextAlign.center,
      );
    } else if (viewContext == "search") {
      emptyIcon = Icons.search;
      emptyText = "keine Lebensmittel gefunden!";
    }
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 35,
                child: Container(),
              ),
              Expanded(
                flex: 20,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 1,
                      child: new LayoutBuilder(builder: (context, constraint) {
                        var cst =
                            constraint.biggest.width < constraint.biggest.height
                                ? constraint.biggest.width
                                : constraint.biggest.height;
                        return new Icon(
                          emptyIcon,
                          size: cst,
                          color: Colors.black45,
                        );
                      }),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 20,
                  child: Text(
                    emptyText,
                    style: const TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                  flex: 20,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: favAddHint,
                  )),
              Expanded(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
        ));
  }
}
