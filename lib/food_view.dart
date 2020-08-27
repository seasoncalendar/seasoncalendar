import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:seasoncalendar/helpers/themes.dart';
import 'favorite_foods.dart';
import 'models/food.dart';
import 'additional_info_dialog.dart';

Widget foodsView(
    List<Food> preparedFoods, int monthIndex, List<dynamic> monthNames) {
  return GridView.builder(
    itemCount: preparedFoods.length,
    padding: const EdgeInsets.all(5.0),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 300,
    ),
    itemBuilder: (context, i) {
      return FoodTile(preparedFoods[i], monthIndex, monthNames);
    },
  );
}

class FoodTile extends StatefulWidget {
  String _foodId;
  String _foodDisplayName;
  String _assetImgPath;
  String _foodInfoURL;
  List<dynamic> _monthNames;
  int _curMonthIndex;
  List<List<String>> _allAvailabilities;
  List<String> _curAvailabilities;
  Color _curAvailabilityColor = Colors.white70;

  FoodTile(Food foodToDisplay, int curMonthIndex, List<dynamic> monthNames) {
    _foodId = foodToDisplay.id;
    _foodDisplayName = foodToDisplay.displayName;
    _assetImgPath = foodToDisplay.assetImgPath;
    _foodInfoURL = foodToDisplay.infoUrl;
    _monthNames = monthNames;
    _curMonthIndex = curMonthIndex;
    _allAvailabilities = List.generate(
        12, (monthIndex) => foodToDisplay.getAvailabilityModes(monthIndex));
    _curAvailabilities = _allAvailabilities[_curMonthIndex];
    _curAvailabilityColor = availabilityModeColor[_curAvailabilities[0]];
  }

  @override
  FoodTileState createState() => new FoodTileState();
}

class FoodTileState extends State<FoodTile> {
  // -1 means 'not favorite', +1 means 'favorite', else undefined.
  int _isFavorite = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isFavoriteFood(widget._foodId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _isFavorite =
              snapshot.hasData ? (snapshot.data ? 1 : -1) : _isFavorite;
        }
        return _buildFoodTile();
      },
    );
  }

  Widget _buildFoodTile() {
    GestureTapCallback tapCallback = () {};
    if (_isFavorite == 1) {
      tapCallback = () {
        removeFavoriteFood(widget._foodId);
        setState(() {
          _isFavorite = -1;
        });
      };
    } else if (_isFavorite == -1) {
      tapCallback = () {
        addFavoriteFood(widget._foodId);
        setState(() {
          _isFavorite = 1;
        });
      };
    }

    Image foodImage = Image(
      image: AssetImage(widget._assetImgPath),
      filterQuality: FilterQuality.low,
    );

    Container availabilityIconContainer = Container(
      color: Colors.white.withAlpha(220),
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: new LayoutBuilder(builder: (context, constraint) {
        return getAvailabilityIconContainer(
            context, constraint, widget._curAvailabilities);
      }),
    );

    GestureTapCallback showFoodInfo = () {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.white,
          content: AdditionalInfoDialog(widget._foodDisplayName, widget._foodInfoURL,
              foodImage, widget._monthNames, widget._allAvailabilities),
          elevation: 10,
        ),
        barrierDismissible: true,
      );
    };

    return Card(
        elevation: 3,
        color: widget._curAvailabilityColor,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 10,
                child: Stack(
                  overflow: Overflow.clip,
                  alignment: AlignmentDirectional.topEnd,
                  children: <Widget>[
                    GestureDetector(
                      onTap: showFoodInfo,
                      child: foodImage,
                    ),
                    FractionallySizedBox(
                      widthFactor: 2.5 / 12,
                      heightFactor: 2.5 / 10,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: ShapeDecoration(
                            color: Colors.white.withAlpha(200),
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(0),
                                  topRight: Radius.circular(0)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.white.withAlpha(200)),
                            )),
                        child: InkWell(
                          onTap: tapCallback,
                          child:
                              new LayoutBuilder(builder: (context, constraint) {
                            return getFavIcon(context, constraint, _isFavorite);
                          }),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Container(
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
                            widget._foodDisplayName,
                            style: foodText,
                          ),
                        ),
                      ),
                    ),
                    availabilityIconContainer
                  ],
                )))
          ],
        ));
  }
}

Icon getFavIcon(context, constraint, int isFavorite) {
  if (isFavorite == 1)
    return Icon(Icons.star, size: constraint.biggest.height);
  else if (isFavorite == -1)
    return Icon(Icons.star_border, size: constraint.biggest.height);
  else
    return Icon(Icons.star_half, size: constraint.biggest.height);
}

Container getAvailabilityIconContainer(
    BuildContext context, constraint, List<String> availabilities) {
  Widget containerChild;

  if (availabilities.length == 1) {
    containerChild = Icon(availabilityModeIcons[availabilities[0]],
        size: constraint.biggest.height, color: Colors.black.withAlpha(180));
  } else {
    containerChild = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(availabilityModeIcons[availabilities[0]],
            size: constraint.biggest.height,
            color: Colors.black.withAlpha(180)),
        Text(" / "),
        Icon(availabilityModeIcons[availabilities[1]],
            size: constraint.biggest.height / 1.4,
            color: Colors.black.withAlpha(140)),
      ],
    );
  }

  return Container(
    child: containerChild,
  );
}
