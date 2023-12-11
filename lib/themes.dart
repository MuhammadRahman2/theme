import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Themes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(primary: Colors.blue),
    // colorScheme: ColorScheme.fromSeed(
    // brightness: Brightness.light,
    // seedColor: Colors.blue,
    // primary: Colors.blue,
    // secondary:Colors.green,
    // ),

    // ... other theme properties
  );

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(primary: Colors.white)

      // colorScheme: ColorScheme.fromSeed(
      // brightness: Brightness.dark,
      // seedColor: Colors.white,
      // primary: Colors.white,
      // secondary:Colors.teal,
      // ),

      // ... other theme properties
      );
}

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  bool _loadTheme() => _box.read(_key) ?? false;

  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  void saveThmed(bool isDarkMode) {
    _box.write(_key, isDarkMode);
  }

  void chageTheme(ThemeData theme) {
    Get.changeTheme(theme);
  }

  void chageThemeMode(ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);
  }
}
