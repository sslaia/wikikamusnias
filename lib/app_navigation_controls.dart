import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wikikamusnias/wiktionary_banner.dart';
import 'package:wikikamusnias/app_settings.dart';
import 'package:wikikamusnias/app_shortcuts.dart';

class AppNavigationControls extends StatelessWidget {
  const AppNavigationControls({super.key, required this.webViewController});

  final WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    const bottomAppBarColor = Color(0xffe9d6ae);
    String wikiHome = 'https://nia.wiktionary.org';

    return Container(
      color: bottomAppBarColor,
      child: Row(
        children: [
          IconButton(
            tooltip: 'home'.tr(),
            icon: const Icon(
              Icons.home_outlined,
              color: Colors.red,
            ),
            onPressed: () {
              showWikiDialog(context);
              webViewController.loadRequest(Uri.parse(wikiHome));
            },
          ),
          const Spacer(),
          IconButton(
            tooltip: 'refresh'.tr(),
            icon: const Icon(Icons.replay, color: Colors.red),
            onPressed: () => webViewController.reload(),
          ),
          IconButton(
            tooltip: 'random'.tr(),
            icon: const Icon(Icons.shuffle_outlined, color: Colors.red),
            onPressed: () => webViewController
                .loadRequest(Uri.parse('$wikiHome/wiki/Special:Random')),
          ),
          IconButton(
            tooltip: 'shortcuts'.tr(),
            icon: const Icon(Icons.switch_access_shortcut_outlined, color: Colors.red),
            onPressed: () => showShortcutsDialog(context),
          ),
          IconButton(
            tooltip: 'settings'.tr(),
            icon: const Icon(Icons.more_vert_outlined, color: Colors.red),
            onPressed: () => showSettingsDialog(context),
          ),
        ],
      ),
    );
  }

  showWikiDialog(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: true,
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      builder: (BuildContext context) {
        return WiktionaryBanner(context: context);
      },
    );
  }

  showSettingsDialog(context) {
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: true,
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      builder: (BuildContext context) {
        return AppSettings(context: context);
      },
    );
  }

  showShortcutsDialog(context) {
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: true,
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      builder: (BuildContext context) {
        return AppShortcuts(
          context: context,
          webViewController: webViewController,
        );
      },
    );
  }
}
