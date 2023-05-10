import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const Color mainColor = Color(0xDF2254C7);
const Color darkColor = Color(0xDF0B111E);
const Color appColor = Color(0xFF68381E);
const Color subColor = Color.fromARGB(255, 196, 107, 11);
const Color lightColor = Color(0xDFFFFFFF);
const Color instColor = Color.fromARGB(254, 218, 117, 255);
Duration animationDuration = const Duration(milliseconds: 200);

MaterialColor mainAppColor = const MaterialColor(0xDF2254C7, <int, Color>{
  50: Color(0xDF2254C7),
  100: Color(0xDF2254C7),
  200: Color(0xDF2254C7),
  300: Color(0xDF2254C7),
  400: Color(0xDF2254C7),
  500: Color(0xDF2254C7),
  600: Color(0xDF2254C7),
  700: Color(0xDF2254C7),
  800: Color(0xDF2254C7),
  900: Color(0xDF2254C7),
});

// Toast
void showMessage(String message, Color myColor) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: myColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showMessageAuth(String message, Color myColor) {
  Fluttertoast.showToast(
    timeInSecForIosWeb: 10,
    msg: message,
    backgroundColor: myColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
