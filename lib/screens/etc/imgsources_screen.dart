import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:seasoncalendar/models/food.dart';
import 'package:seasoncalendar/generated/l10n.dart';

class ImgSourcesScreen extends StatelessWidget {
  final List<Food> _allFoods;

  ImgSourcesScreen(this._allFoods, {Key? key}) : super(key: key) {
    _allFoods.sort((a, b) => a.displayName.compareTo(b.displayName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).imprintPageImagesHeadline)),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: ListView.separated(
            itemCount: _allFoods.length,
            itemBuilder: (context, i) {
              return ListTile(
                dense: false,
                title: Text(
                  _allFoods[i].displayName,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(L10n.of(context).imprintImgSourcesLicense +
                    _allFoods[i].assetImgInfo.split("/")[0].trim() +
                    L10n.of(context).imprintImgSourcesPublisher +
                    _allFoods[i].assetImgInfo.split("/")[1].trim()),
                trailing: IconButton(
                  icon: const Icon(Icons.open_in_new),
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
