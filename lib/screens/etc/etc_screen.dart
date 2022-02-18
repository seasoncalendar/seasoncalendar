import 'package:flutter/material.dart';
import 'package:seasoncalendar/generated/l10n.dart';
import 'package:seasoncalendar/app_config.dart';

class EtcPage extends StatelessWidget {
  const EtcPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).etcPageTitle)),
        body: Container(
            margin: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: getEtcPageItems(context),
              ),
            )));
  }

  List<Widget> getEtcPageItems(BuildContext context) {
    bool isGooglePlay =
        AppConfig.of(context).buildFlavor == AppFlavor.googleplay;
    List<Widget> etcPageItems = List<Widget>.empty(growable: true);

    etcPageItems.add(ListTile(
      leading: const Icon(Icons.help),
      title: Text(L10n.of(context).howToPageTitle),
      onTap: () => Navigator.of(context).pushNamed("/etc/howto"),
    ));
    etcPageItems.add(const Divider());
    etcPageItems.add(ListTile(
      leading: const Icon(Icons.info),
      title: Text(L10n.of(context).aboutPageTitle),
      onTap: () => Navigator.of(context).pushNamed("/etc/about"),
    ));
    etcPageItems.add(const Divider());
    etcPageItems.add(ListTile(
      leading: const Icon(Icons.extension),
      title: Text(L10n.of(context).contribPageTitle),
      onTap: () => Navigator.of(context).pushNamed("/etc/contrib"),
    ));
    etcPageItems.add(const Divider());

    // leave out support page for compliance with Google Play
    if (!isGooglePlay) {
      etcPageItems.add(ListTile(
        leading: const Icon(Icons.favorite),
        title: Text(L10n.of(context).supportPageTitle),
        onTap: () => Navigator.of(context).pushNamed("/etc/support"),
      ));
      etcPageItems.add(const Divider());
    }

    etcPageItems.add(ListTile(
      leading: const Icon(Icons.account_balance),
      title: Text(L10n.of(context).imprintPageTitle),
      onTap: () => Navigator.of(context).pushNamed("/etc/imprint"),
    ));

    return etcPageItems;
  }
}
