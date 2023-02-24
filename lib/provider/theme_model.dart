import 'package:flutter/material.dart';
import 'package:training_brain/theme/theme.dart';

class ThemeModel extends ChangeNotifier {

  ThemeData themeData = MyTheme.themeData;

  void setDarkMode(bool value) async {
    await MyTheme.setDarkMode(value);
    themeData = MyTheme.themeData;
    notifyListeners();
  }

  bool isDarkMode() => MyTheme.isDarkMode();
}