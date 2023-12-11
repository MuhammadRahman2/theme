import 'package:dynamically_theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ThemeController themeController = Get.put(ThemeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: themeController.theme,
        home: Example());
  }
}

class Example extends StatelessWidget {
  Example({super.key});

  ThemeController find = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx Theme'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              if (Get.isDarkMode) {
                // find.chageThemeMode(ThemeMode.light);
                // second approch
                find.chageTheme(Themes.lightTheme);

                find.saveThmed(false);
              } else {
                // find.chageThemeMode(ThemeMode.dark);
                // second approch
                find.chageTheme(Themes.darkTheme);
                find.saveThmed(true);
              }
            },
            child: const Text('change Themee')),
      ),
    );
  }
}
