import 'package:flutter/material.dart';
import 'package:ojali/screens/main_screens/store_screen.dart';
import '../../helpers/const.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedSwitcher(
        duration: animationDuration,
        child: currentIndex == 0
            ? const SettingScreen()
            : currentIndex == 1
                ? const StoreScreen()
                : currentIndex == 2
                    ? const HomeScreen()
                    : const HomeScreen(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orangeAccent.withOpacity(0.8),
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              label: 'setting',
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              )),
          BottomNavigationBarItem(
              label: 'store',
              icon: Icon(
                Icons.store,
                color: Colors.white,
              )),
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
