import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFEDDAC3),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          color: Color(0xFF8F6330),
          fontSize: 25.0,
          fontWeight: FontWeight.bold),
      backgroundColor: Color(0xFFEDDAC3),
      actionsIconTheme: IconThemeData(
        color: Color(0xFF8F6330),
      ),
    ),
    cardTheme: const CardTheme(
      color: Color(0xFFEDD2B3),
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: Color(0xFF8F6330),
      ),
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF1F475A),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 25.0,
          fontWeight: FontWeight.bold),
      backgroundColor: Color(0xFF1F475A),
      actionsIconTheme: IconThemeData(
        color: Color(0xFFFFFFFF),
      ),
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF607D8B),
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: Color(0xFFFFFFFF),
      ),
    ),
    brightness: Brightness.dark,
  );

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
