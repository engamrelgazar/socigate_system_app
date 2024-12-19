library theme;

import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColor.primary,
      scaffoldBackgroundColor: AppColor.white,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColor.primary,
        secondary: AppColor.secondary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.primary,
        titleTextStyle: AppTextStyle.header.copyWith(color: AppColor.white),
        iconTheme: IconThemeData(color: AppColor.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      )),
      textTheme: TextTheme(
        displayLarge: AppTextStyle.header,
        displayMedium: AppTextStyle.subHeader,
        displaySmall: AppTextStyle.caption,
        headlineLarge: AppTextStyle.header,
        headlineMedium: AppTextStyle.subHeader,
        headlineSmall: AppTextStyle.caption,
        titleLarge: AppTextStyle.header,
        titleMedium: AppTextStyle.body,
        titleSmall: AppTextStyle.caption,
        bodyLarge: AppTextStyle.body,
        bodyMedium: AppTextStyle.body,
        bodySmall: AppTextStyle.caption,
        labelLarge: AppTextStyle.body,
        labelMedium: AppTextStyle.body,
        labelSmall: AppTextStyle.small,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColor.primary,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColor.dark,
      scaffoldBackgroundColor: AppColor.black,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColor.dark,
        secondary: AppColor.secondary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.dark,
        titleTextStyle: AppTextStyle.header.copyWith(color: AppColor.white),
        iconTheme: IconThemeData(color: AppColor.white),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyle.header,
        displayMedium: AppTextStyle.subHeader,
        displaySmall: AppTextStyle.caption,
        headlineLarge: AppTextStyle.header,
        headlineMedium: AppTextStyle.subHeader,
        headlineSmall: AppTextStyle.caption,
        titleLarge: AppTextStyle.header,
        titleMedium: AppTextStyle.subHeader,
        titleSmall: AppTextStyle.caption,
        bodyLarge: AppTextStyle.body,
        bodyMedium: AppTextStyle.body,
        bodySmall: AppTextStyle.caption,
        labelLarge: AppTextStyle.body,
        labelMedium: AppTextStyle.caption,
        labelSmall: AppTextStyle.caption,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColor.secondary,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
