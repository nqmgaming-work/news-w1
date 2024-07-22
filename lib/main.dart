import 'package:first_pj/screen/home/expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MaterialApp(
      home: const Expenses(),
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        snackBarTheme: const SnackBarThemeData(
            behavior: SnackBarBehavior.floating, actionTextColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.amber,
          shadowColor: Colors.black,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          margin: EdgeInsets.all(10),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        snackBarTheme: const SnackBarThemeData(
            behavior: SnackBarBehavior.floating, actionTextColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.amber,
          shadowColor: Colors.black,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          margin: EdgeInsets.all(10),
        ),
      ),
      themeMode: ThemeMode.dark,
    ),
  );
}
