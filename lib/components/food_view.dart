import 'package:flutter/material.dart';

import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/models/food_display_configuration.dart';
import 'package:seasoncalendar/components/food_tile.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:swipe/swipe.dart';

enum FoodViewMode {
  main,
  favorite,
  search
}

class FoodView extends StatelessWidget {
  final List<Food> _selectedFoods;
  final FoodViewMode _mode;
  final FoodDisplayConfiguration _fdc;
  final bool displaySearch = false;

  FoodView(FoodDisplayConfiguration fdc, {Key? key})
      : _fdc = fdc,
        _selectedFoods = fdc.foodsToDisplay,
        _mode = fdc.favoritesSelected ? FoodViewMode.favorite : FoodViewMode.main, super(key: key);

  const FoodView.fromSearchResult(FoodDisplayConfiguration fdc, List<Food> searchResultFoods, {Key? key})
      : _fdc = fdc,
        _selectedFoods = searchResultFoods,
        _mode = FoodViewMode.search, super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget innerView = _selectedFoods.isEmpty
        ? _buildEmpty(context, _mode)
        : _buildFull(context);

    // can't swipe foodView when no display configuration given
    // (e.g. when displaying search results)
    if (_mode == FoodViewMode.search) {
      return innerView;
    } else {
      return Swipe(
        onSwipeLeft: () {
          _fdc.shiftMonth(1);
        },
        onSwipeRight: () {
          _fdc.shiftMonth(-1);
        },
        child: innerView,
      );
    }
  }

  Widget _buildFull(BuildContext context) {
    return GridView.builder(
      itemCount: _selectedFoods.length,
      padding: const EdgeInsets.all(5.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
      ),
      itemBuilder: (context, i) {
        return FoodTile(_selectedFoods[i], _fdc.monthIndex);
      },
    );
  }

  Widget _buildEmpty(BuildContext context, FoodViewMode mode) {
    IconData emptyIcon = Icons.spa;
    String emptyText = L10n.of(context).emptyFoodsViewText;
    Widget emptyHint = Text(
      L10n.of(context).emptyDefaultViewHint,
      style: const TextStyle(color: Colors.black54),
      textAlign: TextAlign.center,
    );

    if (mode == FoodViewMode.favorite) {
      emptyIcon = Icons.star_border;
      emptyText = L10n.of(context).emptyFavoritesViewText;
      emptyHint = Text(
        L10n.of(context).emptyDefaultViewHint +
            '\n' +
            L10n.of(context).emptyFavoritesViewHint,
        style: const TextStyle(color: Colors.black54),
        textAlign: TextAlign.center,
      );
    } else if (mode == FoodViewMode.search) {
      emptyIcon = Icons.search;
      emptyText = L10n.of(context).emptySearchViewText;
      emptyHint = Container();
    }
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
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
        ));
  }
}
