import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeSettings {
  ThemeSettings._();

  static List<ThemeData> multipleThemes = [
    ThemeData(
        backgroundColor: Colors.blue,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow)),
    ThemeData(
        backgroundColor: Colors.white,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.green)),
    ThemeData(
        backgroundColor: Colors.purple,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink)),
    ThemeData(
        backgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red)),
    ThemeData(
        backgroundColor: Colors.red,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue)),
  ];

  static ThemeData lightTheme = ThemeData(
    fontFamily: "Poppins",
    disabledColor: Colors.grey,
    colorSchemeSeed: HexColor("#8A58B2"),
    scaffoldBackgroundColor: HexColor("#EBEDFA"),
    dividerTheme: DividerThemeData(
      color: HexColor("#EBEDFA"),
      thickness: 1,
      space: 0,
    ),
    brightness: Brightness.light,
    cardTheme: CardTheme(
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      // filled: true,
      //  fillColor: HexColor("#EDE5F3"),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "Poppins",
    colorSchemeSeed: HexColor("#8A58B2"),
    dividerTheme: DividerThemeData(
      color: HexColor("#EBEDFA"),
      thickness: 1,
      space: 0,
    ),
    brightness: Brightness.dark,
    cardTheme: CardTheme(
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
