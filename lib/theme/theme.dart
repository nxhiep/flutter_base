import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training_brain/constants/colors.dart';
import 'package:training_brain/constants/configs.dart';

class MyTheme {
  static ThemeData _getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        selectedColor: MyColors.selectedColor,
        padding: const EdgeInsets.all(0),
        disabledColor: Colors.grey,
        brightness: Brightness.dark,
        labelStyle: const TextStyle(),
        secondaryLabelStyle: const TextStyle(),
        secondarySelectedColor: Colors.red
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: MyColors.activeColor,
        activeTickMarkColor: MyColors.activeColor,
        thumbColor: MyColors.activeColor,
        inactiveTrackColor: MyColors.activeColor.withOpacity(.2),
      ),
    );
  }

  static ThemeData _getLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        selectedColor: MyColors.selectedColor,
        padding: const EdgeInsets.all(0),
        disabledColor: Colors.grey,
        brightness: Brightness.dark,
        labelStyle: const TextStyle(),
        secondaryLabelStyle: const TextStyle(),
        secondarySelectedColor: Colors.red
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: MyColors.activeColor,
        activeTickMarkColor: MyColors.activeColor,
        thumbColor: MyColors.activeColor,
        inactiveTrackColor: MyColors.activeColor.withOpacity(.2),
      ),
    );
  }

  static ThemeData themeData = _getLightTheme();

  static Future<void> loadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int themeMode = sharedPreferences.getInt(Config.keyThemeMode) ?? Brightness.light.index;
    if(themeMode == Brightness.light.index) {
      setDarkMode(false);
    } else {
      setDarkMode(true);
    }
  }

  static bool isDarkMode() {
    return themeData.brightness == Brightness.dark;
  }

  static Future<void> setDarkMode(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    themeData = value ? _getDarkTheme() : _getLightTheme();
    await sharedPreferences.setInt(Config.keyThemeMode, themeData.brightness.index);
  }
}