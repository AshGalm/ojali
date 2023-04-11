import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dark_theme_provider.dart';

class SwitchMode extends StatefulWidget {
  const SwitchMode({
    super.key,
  });
  // final bool siwtchColor;
  @override
  State<SwitchMode> createState() => _SwitchModeState();
}

class _SwitchModeState extends State<SwitchMode> {
  bool light = false;
  @override
  Widget build(BuildContext context) {
    final themeListener =
        Provider.of<DarkThemeProvider>(context, listen: false);

    final themeFunction =
        Provider.of<DarkThemeProvider>(context, listen: false);

    return Switch(
      value: themeListener.isDark,
      activeColor: Colors.red,
      onChanged: (bool value) {
        setState(() {
          themeFunction.switchMode();
        });
      },
    );
  }
}
