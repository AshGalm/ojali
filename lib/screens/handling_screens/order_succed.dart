import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/const.dart';
import '../../main.dart';
import '../../providers/dark_theme_provider.dart';

class SuccedOrder extends StatefulWidget {
  const SuccedOrder({super.key});

  @override
  State<SuccedOrder> createState() => _SuccedOrderState();
}

class _SuccedOrderState extends State<SuccedOrder> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
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
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100.0,
        ),
        child: Column(children: [
          Image.asset('assets/done.png'),
          Text(
            AppLocalizations.of(context)!.order_placed,
            style: TextStyle(
                fontSize: 25,
                color: themeListener.isDark ? lightColor : darkColor),
          ),
          Text(
            AppLocalizations.of(context)!.re,
            style: TextStyle(
                fontSize: 12,
                color: themeListener.isDark ? lightColor : subColor),
          ),
        ]),
      ),
    );
  }
}
