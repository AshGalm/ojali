import 'package:flutter/material.dart';
import 'package:ojali/screens/main_screens/store_screen.dart';
import 'package:provider/provider.dart';
import '../../helpers/const.dart';
import '../../providers/dark_theme_provider.dart';
import 'home_screen.dart';
import 'setting_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    //  Theme provider functions variable

    return Scaffold(
      body: AnimatedSwitcher(
        // HomeScreen
        duration: animationDuration,
        child: currentIndex == 0
            ? const HomeScreen()
            : currentIndex == 1
                ? const StoreScreen()
                : currentIndex == 2
                    ? const SettingScreen()
                    : const SettingScreen(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeListener.isDark ? darkColor : Colors.transparent,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
                color: themeListener.isDark ? lightColor : darkColor,
              )),
          BottomNavigationBarItem(
              label: 'store',
              icon: Icon(
                Icons.store,
                color: themeListener.isDark ? lightColor : darkColor,
              )),
          BottomNavigationBarItem(
              label: 'setting',
              icon: Icon(
                Icons.settings,
                color: themeListener.isDark ? lightColor : darkColor,
              )),
        ],
      ),
    );
  }
}
