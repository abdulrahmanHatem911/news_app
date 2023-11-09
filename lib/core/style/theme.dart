import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: 'sst-arabic',
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleSpacing: 20,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          elevation: 20.0),
      useMaterial3: true,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: AppColor.primaryColor,
        ),
        suffixStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: AppColor.primaryColor,
        ),
        suffixIconColor: AppColor.primaryColor,
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: Colors.black45,
        ),
        labelStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      fontFamily: 'sst-arabic',
      brightness: Brightness.dark,
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: const Color(0xFF333739),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF333739),
        titleSpacing: 20,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF333739),
            statusBarIconBrightness: Brightness.light),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xFF333739),
        elevation: 20.0,
      ),
      useMaterial3: true,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColor.primaryColor,
        selectionHandleColor: AppColor.primaryColor,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColor.primaryColor,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        colorScheme: const ColorScheme.dark(
          primary: AppColor.primaryColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        suffixStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: AppColor.primaryColor,
        ),
        prefixIconColor: Colors.amber.shade200,
        suffixIconColor: Colors.amber.shade200,
        fillColor: Colors.grey[900],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: Colors.white70,
        ),
        labelStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.darkColor,
        //change theme for text inside button
        extendedTextStyle: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      textTheme: darkTextTheme,
    );
  }

  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
      color: Colors.black54,
    ),
    bodyMedium: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade700,
    ),
    bodySmall: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade700,
    ),
    titleLarge: const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    titleMedium: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleSmall: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    displayLarge: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black45,
    ),
    displayMedium: const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      color: Colors.black45,
    ),
    displaySmall: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineLarge: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineMedium: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: const TextStyle(
      fontSize: 16.0,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
  );

  static TextTheme darkTextTheme = const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    displayLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontSize: 16.0,
      color: Colors.black45,
      fontWeight: FontWeight.w600,
    ),
  );
}
