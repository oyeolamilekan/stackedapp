import 'dart:ui';

import 'package:flutter/material.dart';

class StackedApp {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigationKey.currentContext!;

  static NavigatorState? get currentState => navigationKey.currentState;

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static void errorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(message),
            ),
          ],
        ),
        duration: Duration(seconds: 1),
        elevation: 0.0,
        margin: EdgeInsets.all(20),
        backgroundColor: hexToColor("#ea001e"),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
