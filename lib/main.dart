import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses.dart';
import "package:flutter/services.dart";
import 'package:flutter/foundation.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 148, 142, 171),
  // primary: const Color.fromARGB(255, 0, 0, 0),
  // secondary: const Color.fromARGB(255, 255, 255, 255),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 89, 55, 226),
  brightness: Brightness.dark,
  // primary: const Color.fromARGB(255, 0, 0, 0),
  // secondary: const Color.fromARGB(255, 255, 255, 255),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((fn) {
      runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData(
        // scaffoldBackgroundColor: const Color.fromARGB(255, 148, 142, 171),
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            // foregroundColor: kColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          labelLarge: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // themeMode: ThemeMode.system,
      home: Expenses(),
    ),
  );


  });

}
