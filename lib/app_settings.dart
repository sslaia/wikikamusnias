import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    const menuItemFontIndigo = TextStyle(fontSize: 14, color: Color(0xff121298), fontStyle: FontStyle.normal);
    const menuItemFontPurple = TextStyle(fontSize: 14, color: Color(0xff9b00a1), fontStyle: FontStyle.normal);
    const menuTitleFontBlack = TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold);
    const borderColorYellow = Color(0xffe9d6ae);
    const containerColorYellow = Color(0xfffaf6ed);
    const containerHeight = 200.0;

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'choose_language',
                  textAlign: TextAlign.center,
                  style: menuTitleFontBlack,
                ).tr(),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.setLocale(const Locale('en'));
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: borderColorYellow))),
                      ),
                      child: const Text(
                        'English',
                        style: menuItemFontPurple,
                      ),
                    ),
                    const SizedBox(width: 50.0),
                    TextButton(
                      onPressed: () {
                        context.setLocale(const Locale('id'));
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: borderColorYellow))),
                      ),
                      child: const Text(
                        'Li Niha',
                        style: menuItemFontIndigo,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}