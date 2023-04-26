import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojali/providers/branches_provider.dart';
import 'package:ojali/providers/dark_theme_provider.dart';
import 'package:ojali/providers/prodcut_provider.dart';
import 'package:ojali/providers/user_provider.dart';
import 'package:ojali/screens/auth_screens/intro_screen.dart';
import 'package:ojali/screens/main_screens/tabs_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/const.dart';
import 'screens/handling_screens/send_data_screen.dart';

// import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  FirebaseAuth auth = FirebaseAuth.instance;

  Locale _locale = const Locale('ar');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  getLocalLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? localCode = prefs.getString('langCode');
    if (localCode == 'en') {
      setState(() {
        _locale = const Locale('en');
        setLocale(const Locale('en'));
      });
    } else {
      setState(() {
        _locale = const Locale('ar');
        setLocale(const Locale('ar'));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getLocalLang();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkThemeProvider>(create: (_) {
          return DarkThemeProvider();
        }),
        ChangeNotifierProvider<ProductProvider>(
          create: (_) {
            return ProductProvider();
          },
        ),
        ChangeNotifierProvider<BranchesProvider>(
          create: (_) {
            return BranchesProvider();
          },
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (_) {
            return UserProvider();
          },
        ),
      ],
      child: Consumer<DarkThemeProvider>(builder: (context, themeListener, _) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: themeListener.isDark ? darkColor : lightColor,
        ));
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
          debugShowCheckedModeBanner: false,
          locale: _locale,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: themeListener.isDark ? darkColor : lightColor,
            ),
            appBarTheme: AppBarTheme(
                titleTextStyle: GoogleFonts.cairo(
                    color: themeListener.isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            textTheme: GoogleFonts.cairoTextTheme(),
          ),
          home: auth.currentUser != null
              ? const TabsScreen()
              : const IntroScreen(),
        );
      }),
    );
  }
}
