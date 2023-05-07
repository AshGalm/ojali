import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ojali/main.dart';
import 'package:ojali/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helpers/const.dart';

class SendDataScreen extends StatefulWidget {
  const SendDataScreen({super.key});

  @override
  State<SendDataScreen> createState() => _SendDataScreenState();
}

class _SendDataScreenState extends State<SendDataScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (_) => const MyApp()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: themeListener.isDark ? darkColor : Colors.white,
      body: Center(
          child: Column(
        children: [
          Image.asset('assets/send.png'),
          Text(
            AppLocalizations.of(context)!.suc,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: themeListener.isDark ? lightColor : appColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(
              FontAwesomeIcons.check,
              size: 80,
              color: appColor,
            ),
          ),
          const SizedBox(
            height: 140,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: themeListener.isDark ? Colors.green : appColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 30, left: 30, top: 5, bottom: 5),
                child: Text(
                  AppLocalizations.of(context)!.re,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: themeListener.isDark ? lightColor : Colors.white),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
