import 'package:flutter/material.dart';
import 'package:seasoncalendar/models/availability.dart';
import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/components/food_details_dialog.dart';
import 'package:seasoncalendar/app_data.dart';
import 'dialog_page_route.dart';

class FoodTile extends StatefulWidget {
  final Food _food;
  final List<Availability> _curAvailabilities;
  late final Color _curAvailabilityColor;

  FoodTile(Food foodToDisplay, int curMonthIndex, {Key? key})
      : _food = foodToDisplay,
        _curAvailabilities = foodToDisplay.getAvailabilitiesList(short: true)[curMonthIndex],
        super(key: Key(foodToDisplay.id)) {
    int fstModeIdx = _curAvailabilities.indexWhere(isAvailable);
    var isUnknown = _curAvailabilities.every((a) => a == Availability.unknown);

    if (isUnknown) {
      _curAvailabilityColor = availabilityModeColor[4]!;
    } else {
      _curAvailabilityColor = availabilityModeColor[fstModeIdx]!;
    }
  }

  @override
  FoodTileState createState() => FoodTileState();
}

class FoodTileState extends State<FoodTile> {
  bool _isFavorite = false;

  void _showFoodDialog() {
    Navigator.push(context, DialogPageRoute(
        builder: (BuildContext context) {
          return FoodDetailsDialog(widget._food);
        }));
  }

  @override
  void initState() {
    super.initState();
    _isFavorite = AppData.of(context, listen: false).isFavoriteFood(widget._food);
  }

  favoriteCallback() {
    if (_isFavorite) {
      AppData.of(context, listen: false).removeFavoriteFood(widget._food.id);
      setState(() {
        _isFavorite = false;
      });
    } else {
      AppData.of(context, listen: false).addFavoriteFood(widget._food.id);
      setState(() {
        _isFavorite = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Container availabilityIconContainer = Container(
      color: Colors.white.withAlpha(220),
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: LayoutBuilder(builder: (context, constraint) {
        return getAvailabilityIconContainer(
            context, constraint, widget._curAvailabilities);
      }),
    );

    return Card(
        elevation: 3,
        color: widget._curAvailabilityColor,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 10,
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  alignment: AlignmentDirectional.topEnd,
                  children: <Widget>[
                    Hero(
                      tag: widget._food.id,
                      child: Material(
                        child: Ink.image(
                          image: AssetImage(widget._food.assetImgPath),
                          fit: BoxFit.cover,
                          child: InkWell(
                            onTap: _showFoodDialog,
                            child: null,
                          )),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 2.5 / 12,
                      heightFactor: 2.5 / 10,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: ShapeDecoration(
                            color: Colors.white.withAlpha(200),
                            shape: OutlineInputBorder(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(0),
                                  topRight: Radius.circular(0)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.white.withAlpha(200)),
                            )),
                        child: InkWell(
                          onTap: favoriteCallback,
                          child: LayoutBuilder(builder: (context, constraint) {
                              return getFavIcon(context, constraint, _isFavorite);
                          }),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          widget._food.displayName,
                          style: foodText,
                        ),
                      ),
                    ),
                  ),
                  availabilityIconContainer
                  ],
                ))
          ],
        ));
  }
}

Icon getFavIcon(context, constraint, bool isFavorite) {
  if (isFavorite) {
    return Icon(Icons.star, size: constraint.biggest.height);
  } else {
    return Icon(Icons.star_border, size: constraint.biggest.height);
  }
}

Container getAvailabilityIconContainer(
    BuildContext context, constraint, List<Availability> availabilities) {
  Widget containerChild;
  int fstModeIdx = availabilities.indexWhere(isAvailable);
  int sndModeIdx = availabilities.indexWhere(isAvailable, fstModeIdx + 1);
  var isUnknown = availabilities.every((a) => a == Availability.unknown);

  if (fstModeIdx == -1 && isUnknown) {
    int iconAlpha = getIconAlphaFromAvailability(Availability.unknown);
    containerChild = Icon(availabilityModeIcons[4],
        size: constraint.biggest.height,
        color: Colors.black.withAlpha(iconAlpha));
  } else if (fstModeIdx == -1) {
    int iconAlpha = getIconAlphaFromAvailability(Availability.none);
    containerChild = Icon(availabilityModeIcons[fstModeIdx],
        size: constraint.biggest.height,
        color: Colors.black.withAlpha(iconAlpha));
  } else if (sndModeIdx == -1) {
    int iconAlpha = getIconAlphaFromAvailability(availabilities[fstModeIdx]);
    containerChild = Icon(availabilityModeIcons[fstModeIdx],
        size: constraint.biggest.height,
        color: Colors.black.withAlpha(iconAlpha));
  } else {
    int primaryIconAlpha =
        getIconAlphaFromAvailability(availabilities[fstModeIdx]);
    int secondaryIconAlpha =
        getIconAlphaFromAvailability(availabilities[sndModeIdx]);
    containerChild = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(availabilityModeIcons[fstModeIdx],
            size: constraint.biggest.height,
            color: Colors.black.withAlpha(primaryIconAlpha)),
        const Text(" / "),
        Icon(availabilityModeIcons[sndModeIdx],
            size: constraint.biggest.height / 1.4,
            color: Colors.black.withAlpha(secondaryIconAlpha)),
      ],
    );
  }

  return Container(
    child: containerChild,
  );
}
