import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  static ThemeData baseTheme = ThemeData(
    fontFamily: "Poppins",
    colorSchemeSeed: HexColor("#8A58B2"),
    primaryColorLight: HexColor("#8A58B2").withOpacity(0.3),
    scaffoldBackgroundColor: HexColor("#EBEDFA"),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: HexColor("#8A58B2")),
    dividerTheme: DividerThemeData(
      color: HexColor("#EBEDFA"),
      thickness: 1,
      space: 0,
    ),
    cardTheme: CardTheme(
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorSchemeSeed: HexColor("#8A58B2"),
    primaryColorLight: HexColor("#8A58B2").withOpacity(0.3),
    scaffoldBackgroundColor: HexColor("#EBEDFA"),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: HexColor("#8A58B2")),
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
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorSchemeSeed: HexColor("#8A58B2"),
    primaryColorLight: HexColor("#8A58B2").withOpacity(0.3),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: HexColor("#8A58B2")),
    scaffoldBackgroundColor: HexColor("#131214"),
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
