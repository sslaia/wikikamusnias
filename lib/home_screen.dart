import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wikikamusnias/app_navigation_controls.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final WebViewController webViewController;
  var loadingProgress = 0;

  // Keys
  final GlobalKey webviewKey = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Wiki variables
  final appBarBgColor = const Color(0xfffaf6ed);
  final appBarFontColor = Colors.black54;
  String wikiHome = 'https://nia.wiktionary.org';

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingProgress = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingProgress = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingProgress = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse(wikiHome),
      );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        var isLastPage = await webViewController.canGoBack();
        if (isLastPage) {
          webViewController.goBack();
          return false;
        } else {
          if (!mounted) return true;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: const Color(0xffe9d6ae),
                content:
                    const Text("no_back", style: TextStyle(color: Colors.black))
                        .tr(),
                duration: const Duration(seconds: 3)),
          );
        }
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          bottomNavigationBar:
              AppNavigationControls(webViewController: webViewController),
          body: Stack(
            children: [
              if (loadingProgress < 100)
                LinearProgressIndicator(
                  backgroundColor: Colors.red,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
                  value: loadingProgress / 100.0,
                ),
              WebViewWidget(key: webviewKey, controller: webViewController),
            ],
          ),
        ),
      ),
    );
  }
}
