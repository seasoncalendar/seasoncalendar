import 'package:flutter/material.dart';
import 'package:seasoncalendar/components/loading_scaffold.dart';

import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/models/food_display_configuration.dart';
import 'package:seasoncalendar/components/food_tile.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/helpers/db_provider.dart';
import 'package:swipe/swipe.dart';

class FoodView extends StatelessWidget {
  List<Food> _selectedFoods;
  final int _monthIndex;
  final String _viewContext;
  final FoodDisplayConfiguration? _fdc;

  FoodView(FoodDisplayConfiguration fdc, {Key? key})
      : _fdc = fdc,
        _selectedFoods = fdc.foodsToDisplay,
        _monthIndex = fdc.monthIndex,
        _viewContext = fdc.favoritesSelected ? "fav" : "main", super(key: key);

  FoodView.fromSearchResult(List<Food> searchResultFoods, int monthIndex, {Key? key})
      : _fdc = null,
        _selectedFoods = searchResultFoods,
        _monthIndex = monthIndex,
        _viewContext = "search", super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget innerView = _selectedFoods.length >= 1
        ? _buildFull(context)
        : _buildEmpty(context, _viewContext);

    // can't swipe foodView when no display configuration given
    // (e.g. when displaying search results)
    if (_fdc == null) {
      return innerView;
    } else {
      return Swipe(
        onSwipeLeft: () {
          _fdc?.shiftMonth(1);
        },
        onSwipeRight: () {
          _fdc?.shiftMonth(-1);
        },
        child: innerView,
      );
    }
  }

  Widget _buildFull(BuildContext context) {
    return FutureBuilder(
        future: DBProvider.db.getFoods(),
        builder: (context, AsyncSnapshot<List<Food>> snapshot) {
          if (snapshot.hasData) {
            // update food data on every build
            List<Food> _newestFoodCatalog = snapshot.data!;
            _selectedFoods = _selectedFoods
                .map((Food f) =>
                    _newestFoodCatalog.firstWhere((Food nf) => nf.id == f.id))
                .toList();

            return GridView.builder(
              itemCount: _selectedFoods.length,
              padding: const EdgeInsets.all(5.0),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
              ),
              itemBuilder: (context, i) {
                return FoodTile(_selectedFoods[i], _monthIndex);
              },
            );
          } else {
            return const LoadingWidget();
          }
        });
  }

  Widget _buildEmpty(BuildContext context, String viewContext) {
    IconData emptyIcon = Icons.spa;
    String emptyText = L10n.of(context).emptyFoodsViewText;
    Widget emptyHint = Text(
      L10n.of(context).emptyDefaultViewHint,
      style: const TextStyle(color: Colors.black54),
      textAlign: TextAlign.center,
    );

    if (viewContext.startsWith("fav")) {
      emptyIcon = Icons.star_border;
      emptyText = L10n.of(context).emptyFavoritesViewText;
      emptyHint = Text(
        L10n.of(context).emptyDefaultViewHint +
            '\n' +
            L10n.of(context).emptyFavoritesViewHint,
        style: const TextStyle(color: Colors.black54),
        textAlign: TextAlign.center,
      );
    } else if (viewContext == "search") {
      emptyIcon = Icons.search;
      emptyText = L10n.of(context).emptySearchViewText;
      emptyHint = Container();
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
                      child: LayoutBuilder(builder: (context, constraint) {
                        var cst =
                            constraint.biggest.width < constraint.biggest.height
                                ? constraint.biggest.width
                                : constraint.biggest.height;
                        return Icon(
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
                    child: emptyHint,
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
