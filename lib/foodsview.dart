import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:seasoncalendar/helpers/themes.dart';
import 'favoritefoods.dart';
import 'food.dart';

Widget foodsView(List<Food> preparedFoods, int monthIndex) {

  return GridView.builder(
    itemCount: preparedFoods.length,
    padding: const EdgeInsets.all(5.0),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 300,

    ),
    itemBuilder: (context, i) {
      return FoodTile(preparedFoods[i], monthIndex);
    },
  );
}

class FoodTile extends StatefulWidget {

  String _foodName;
  String _assetImgPath;
  Color _availabilityColor = Colors.black12;
  List<String> _availabilities;

  FoodTile(Food foodToDisplay, int monthIndex) {
    _foodName = foodToDisplay.name;
    _assetImgPath = foodToDisplay.assetImgPath;
    _availabilities = foodToDisplay.getAvailabilityModes(monthIndex);
    _availabilityColor = availabilityModeColor[_availabilities[0]];

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
      future: isFavoriteFood(widget._foodName),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _isFavorite = snapshot.hasData ? (snapshot.data ? 1 : -1) : _isFavorite;
        }
        return _buildFoodTile();
      },
    );
  }

  Widget _buildFoodTile() {

    GestureTapCallback tapCallback = () {};
    if (_isFavorite == 1) {
        tapCallback = () {
          removeFavoriteFood(widget._foodName);
          setState(() {
            _isFavorite = -1;
          });
        };
    } else if (_isFavorite == -1) {
      tapCallback = () {
        addFavoriteFood(widget._foodName);
        setState(() {
          _isFavorite = 1;
        });
      };
    }

    return Card(
      elevation: 3,
      color: widget._availabilityColor,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Stack(
              overflow: Overflow.clip,
              alignment: AlignmentDirectional.topEnd,
              children: <Widget>[
                Image(
                  image: AssetImage(widget._assetImgPath),
                  filterQuality: FilterQuality.low,
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
                        borderSide: BorderSide(width: 0, color: Colors.white.withAlpha(200)),
                      )
                    ),
                    child: InkWell(
                      onTap: tapCallback,
                      child: new LayoutBuilder(builder: (context, constraint) {
                        return getFavIcon(context, constraint, _isFavorite);
                      }),
                    ),
                  ),
                ),
              ],
            )
          ),
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
                            widget._foodName,
                            style: foodText,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white.withAlpha(220),
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: new LayoutBuilder(builder: (context, constraint) {
                      return getAvailabilityIconContainer(context, constraint, widget._availabilities);
                      }
                    ),
                  ),
                ],
              )
            )
          )
        ],
      )
    );
  }
}

Icon getFavIcon(context, constraint, int isFavorite) {
  if (isFavorite == 1) return Icon(Icons.star, size: constraint.biggest.height);
  else if (isFavorite == -1) return Icon(Icons.star_border, size: constraint.biggest.height);
  else return Icon(Icons.star_half, size: constraint.biggest.height);
}

Container getAvailabilityIconContainer(BuildContext context, constraint, List <String> availabilities) {

  Widget containerChild;
  Color iconColor1 = Colors.black.withAlpha(180);
  if (availabilities[0].contains("Season")) {
    iconColor1 = Colors.lightGreen[900].withAlpha(180);
  }

  if (availabilities.length == 1) {
    containerChild = Icon(availabilityModeIcons[availabilities[0]], size: constraint.biggest.height, color: iconColor1,);
  } else {
    Color iconColor2 = Colors.black.withAlpha(180);
    if (availabilities[1].contains("Season")) {
      iconColor2 = Colors.lightGreen[900].withAlpha(180);
    }
    containerChild = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(availabilityModeIcons[availabilities[0]], size: constraint.biggest.height, color: iconColor1),
        Icon(availabilityModeIcons[availabilities[1]], size: constraint.biggest.height, color: iconColor2),
      ],
    );
  }

  return Container(
    child: containerChild,
  );
}