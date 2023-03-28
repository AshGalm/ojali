import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:ojali/screens/auth_screens/sing_up_screen.dart';
// import 'package:ojali/screens/main_screens/home_screen.dart';

import 'screens/auth_screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الاوجلي',
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line

        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'), // arabic
        Locale('en'), // English
      ],
      // locale: Locale('en'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
