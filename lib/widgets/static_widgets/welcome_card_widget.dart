import 'package:flutter/material.dart';
import 'package:ojali/helpers/const.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/dark_theme_provider.dart';

class WelcomeUser extends StatefulWidget {
  const WelcomeUser({super.key});

  @override
  State<WelcomeUser> createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //  Theme provider functions variable
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: themeListener.isDark
                      ? Colors.transparent
                      : Colors.transparent)
            ]),
        height: size.width * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.welcome,
              style: TextStyle(
                  color: themeListener.isDark ? lightColor : darkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
