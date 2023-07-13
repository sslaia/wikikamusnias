import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppShortcuts extends StatelessWidget {
  const AppShortcuts(
      {super.key, required this.context, required this.webViewController});

  final BuildContext context;
  final WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    const menuItemFontIndigo = TextStyle(fontSize: 14, color: Color(0xff121298), fontStyle: FontStyle.normal);
    const menuItemFontPurple = TextStyle(fontSize: 14, color: Color(0xff9b00a1), fontStyle: FontStyle.normal);
    const menuTitleFontBlack = TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold);
    const borderColorYellow = Color(0xffe9d6ae);
    const containerColorYellow = Color(0xfffaf6ed);
    const containerHeight = 400.0;
    String wikiHome = 'https://nia.wiktionary.org';
    String niasKeyboard =
        'https://nia.wikipedia.org/wiki/Wikipedia:Fafa_wanura_Nias';
    String aboutWiki = 'https://nia.wiktionary.org/wiki/Wiktionary:Sanandrösa';
    String aboutApp = 'https://wikikamusnias.blogspot.com';

    return Container(
      width: double.infinity,
      height: containerHeight,
      padding: const EdgeInsets.all(32.0),
      decoration: const BoxDecoration(
        color: containerColorYellow,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('shortcuts', style: menuTitleFontBlack).tr(),
            const SizedBox(height: 20.0),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              children: [
                TextButton(
                  onPressed: () {
                    webViewController.loadRequest(
                        Uri.parse('$wikiHome/wiki/Special:RecentChanges'));
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: borderColorYellow))),
                  ),
                  child: Text('recent_changes', style: menuItemFontIndigo).tr(),
                ),
                TextButton(
                  onPressed: () {
                    webViewController.loadRequest(
                        Uri.parse('$wikiHome/wiki/Special:SpecialPages'));
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: borderColorYellow))),
                  ),
                  child: Text('special_pages', style: menuItemFontPurple).tr(),
                ),
                TextButton(
                  onPressed: () {
                    webViewController.loadRequest(
                        Uri.parse('$wikiHome/wiki/Wiktionary:Angombakhata'));
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: borderColorYellow))),
                  ),
                  child: Text('announcement', style: menuItemFontIndigo).tr(),
                ),
                TextButton(
                  onPressed: () {
                    webViewController.loadRequest(
                        Uri.parse('$wikiHome/wiki/Wiktionary:Bawagöli_zato'));
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: borderColorYellow))),
                  ),
                  child: Text('community_portal', style: menuItemFontPurple).tr(),
                ),
                TextButton(
                  onPressed: () {
                    webViewController.loadRequest(
                        Uri.parse('$wikiHome/wiki/Wiktionary:Monganga_afo'));
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: borderColorYellow))),
                  ),
                  child: Text('village_pump', style: menuItemFontIndigo).tr(),
                ),
                TextButton(
                  onPressed: () {
                    webViewController.loadRequest(
                        Uri.parse('$wikiHome/wiki/Wiktionary:Nahia_wamakori'));
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: borderColorYellow))),
                  ),
                  child: Text('sandbox', style: menuItemFontPurple).tr(),
                ),
                TextButton(
                  onPressed: () {
                    webViewController
                        .loadRequest(Uri.parse('$wikiHome/wiki/Help:Fanolo'));
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: borderColorYellow))),
                  ),
                  child: Text('help', style: menuItemFontIndigo).tr(),
                ),
                TextButton(
                  onPressed: () {
                    webViewController.loadRequest(
                        Uri.parse('$wikiHome/wiki/Wiktionary:Sangai_halöŵö'));
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: borderColorYellow))),
                  ),
                  child: Text('helpers', style: menuItemFontPurple).tr(),
                ),
                TextButton(
                  onPressed: () {
                    webViewController.loadRequest(Uri.parse(niasKeyboard));
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: borderColorYellow))),
                  ),
                  child: Text('nias_keyboard', style: menuItemFontIndigo).tr(),
                ),
                TextButton(
                  onPressed: () {
                    webViewController.loadRequest(Uri.parse(aboutWiki));
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: borderColorYellow))),
                  ),
                  child: Text('about_wiki', style: menuItemFontPurple).tr(),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    webViewController.loadRequest(Uri.parse(aboutApp));
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: borderColorYellow))),
                  ),
                  child: Text('about_app', style: menuItemFontIndigo).tr(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
