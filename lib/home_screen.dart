import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    var media = MediaQuery.sizeOf(context);

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
          appBar: media.height > 768
              ? AppBar(
                  backgroundColor: appBarBgColor,
                  title: Text(
                    'wikinias_slogan',
                    style: GoogleFonts.grandstander(
                      textStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: appBarFontColor),
                    ),
                  ).tr(),
                )
              : null,
          bottomNavigationBar:
              AppNavigationControls(webViewController: webViewController),
          body: Column(
            children: [
              if (loadingProgress < 100)
                LinearProgressIndicator(
                  backgroundColor: Colors.black,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                  value: loadingProgress / 100.0,
                ),
              Expanded(child: WebViewWidget(key: webviewKey, controller: webViewController)),
            ],
          ),
        ),
      ),
    );
  }
}
