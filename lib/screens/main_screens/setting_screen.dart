import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ojali/screens/main_screens/inform_screen.dart';
import 'package:ojali/screens/main_screens/reset_password_screen.dart';
import 'package:provider/provider.dart';

import '../../helpers/const.dart';
import '../../main.dart';
import '../../providers/dark_theme_provider.dart';
import '../../widgets/clickable_widgets/switch_mode.dart';
import '../auth_screens/login_screen.dart';
import '../sub_screens/order_details_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool value = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Scaffold(
        backgroundColor: themeListener.isDark ? darkColor : lightColor,
        appBar: AppBar(
          backgroundColor:
              themeListener.isDark ? Colors.transparent : Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.setting,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                AppLocalizations.of(context)!.localeName == 'ar'
                    ? MyApp.setLocale(context, const Locale('en'))
                    : MyApp.setLocale(context, const Locale('ar'));
              },
              child: Icon(
                Icons.language,
                color: themeListener.isDark ? lightColor : darkColor,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.width * 0.5,
                  width: size.width * 0.5,
                  child: Image.asset(
                    'assets/setting.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.email,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                themeListener.isDark ? lightColor : darkColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          auth.currentUser?.email ?? '',
                          style: TextStyle(
                              color:
                                  themeListener.isDark ? lightColor : darkColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: themeListener.isDark
                      ? lightColor.withOpacity(0.2)
                      : darkColor.withOpacity(0.2),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppLocalizations.of(context)!.usermode,
                          style: TextStyle(
                              color:
                                  themeListener.isDark ? lightColor : darkColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SwitchMode(),
                    ],
                  ),
                ),
                Divider(
                  color: themeListener.isDark
                      ? lightColor.withOpacity(0.2)
                      : darkColor.withOpacity(0.2),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.article_outlined,
                        size: 40,
                        color: themeListener.isDark ? lightColor : darkColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const OrderDetails()));
                          },
                          child: Text(
                            AppLocalizations.of(context)!.my_order,
                            style: TextStyle(
                                color: themeListener.isDark
                                    ? lightColor
                                    : darkColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: themeListener.isDark
                      ? lightColor.withOpacity(0.2)
                      : darkColor.withOpacity(0.2),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock_rounded,
                        size: 40,
                        color: themeListener.isDark ? lightColor : darkColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const ResetPasswordScreen()));
                          },
                          child: Text(
                            AppLocalizations.of(context)!.changepass,
                            style: TextStyle(
                                color: themeListener.isDark
                                    ? lightColor
                                    : darkColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: themeListener.isDark
                      ? lightColor.withOpacity(0.2)
                      : darkColor.withOpacity(0.2),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning_rounded,
                        size: 40,
                        color: themeListener.isDark ? lightColor : darkColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const InformScreen()));
                          },
                          child: Text(
                            AppLocalizations.of(context)!.tellisu,
                            style: TextStyle(
                                color: themeListener.isDark
                                    ? lightColor
                                    : darkColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: themeListener.isDark
                      ? lightColor.withOpacity(0.2)
                      : darkColor.withOpacity(0.2),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.output_rounded,
                        size: 40,
                        color: themeListener.isDark ? lightColor : darkColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const LoginScreen()),
                                (route) => false);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.logout,
                            style: TextStyle(
                                color: themeListener.isDark
                                    ? lightColor
                                    : darkColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
