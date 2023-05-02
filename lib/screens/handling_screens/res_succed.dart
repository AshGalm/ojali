import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ojali/main.dart';
import 'package:ojali/providers/dark_theme_provider.dart';
import 'package:ojali/screens/auth_screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helpers/const.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (_) => const LoginScreen()));
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
        ],
      )),
    );
  }
}
