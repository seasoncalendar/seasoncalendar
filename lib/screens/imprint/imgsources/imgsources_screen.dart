import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:seasoncalendar/theme/themes.dart';
import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/l10n/app_localizations.dart';

class ImgSourcesScreen extends StatelessWidget {
  List<Food> _allFoods;

  ImgSourcesScreen(List<Food> allFoods) {
    _allFoods = allFoods;
    _allFoods.sort((a, b) => a.displayName.compareTo(b.displayName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text(AppLocalizations.of(context).imprintPageImagesHeadline)),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: ListView.separated(
            itemCount: _allFoods.length,
            itemBuilder: (context, i) {
              return ListTile(
                dense: false,
                title: Text(
                  _allFoods[i].displayName,
                  style: defaultTheme.textTheme.headline6,
                ),
                subtitle: Text(AppLocalizations.of(context).imprintImgSourcesLicense +
                    _allFoods[i].assetImgInfo.split("/")[0].trim() +
                    AppLocalizations.of(context).imprintImgSourcesPublisher +
                    _allFoods[i].assetImgInfo.split("/")[1].trim()),
                trailing: IconButton(
                  icon: Icon(Icons.open_in_new),
                  onPressed: () async {
                    final url = _allFoods[i].assetImgSourceUrl;
                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        forceSafariVC: false,
                      );
                    }
                  },
                ),
              );
            },
            separatorBuilder: (context, i) => const Divider(
              height: 5,
            ),
          ),
        ));
  }
}
