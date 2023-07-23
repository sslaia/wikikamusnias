import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WiktionaryBanner extends StatelessWidget {
  const WiktionaryBanner({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    const fontColorBlack = TextStyle(fontSize: 14, color: Colors.black54, fontStyle: FontStyle.normal);
    const containerColorYellow = Color(0xfffaf6ed);
    const containerHeight = 150.0;

    return Container(
      decoration: const BoxDecoration(
        color: containerColorYellow,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      width: double.infinity,
      height: containerHeight,
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'wiktionary_banner',
            style: fontColorBlack,
          ).tr(),
          Text(
            'wikinias_slogan2',
            style: fontColorBlack,
          ).tr(),
        ],
      ),
    );
  }
}
