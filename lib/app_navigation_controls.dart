import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wikikamusnias/wiktionary_banner.dart';
import 'package:wikikamusnias/app_settings.dart';
import 'package:wikikamusnias/app_shortcuts.dart';

class AppNavigationControls extends StatelessWidget {
  const AppNavigationControls({super.key, required this.webViewController});

  final WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    const bottomAppBarColor = Color(0xfffaf6ed);
    String wikiHome = 'https://nia.wiktionary.org';
    String wikiName = 'Wikikamus Nias';

    return Container(
      color: bottomAppBarColor,
      child: Row(
        children: [
          media.width > 481
              ? TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () => showWikiDialog(context),
                  child: Text(
                    wikiName,
                    style: GoogleFonts.cinzelDecorative(
                      textStyle: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              : TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () => showWikiDialog(context),
                  child: Text(
                    'W',
                    style: GoogleFonts.cinzelDecorative(
                      textStyle: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.home_outlined,
              color: Colors.red,
            ),
            onPressed: () => webViewController.loadRequest(Uri.parse(wikiHome)),
          ),
          IconButton(
            icon: const Icon(Icons.replay, color: Colors.red),
            onPressed: () => webViewController.reload(),
          ),
          IconButton(
            icon: const Icon(Icons.shuffle_outlined, color: Colors.red),
            onPressed: () => webViewController
                .loadRequest(Uri.parse('$wikiHome/wiki/Special:Random')),
          ),
          IconButton(
            icon: const Icon(Icons.switch_access_shortcut_outlined, color: Colors.red),
            onPressed: () => showShortcutsDialog(context),
          ),
          IconButton(
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
