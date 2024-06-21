import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../object_constants/object_constants.dart';


class AppTheme {
  double kButtonHeight = 48.h;
  ThemeData lightTheme() => ThemeData(
        fontFamily: 'Tajawal',
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xffA6CB3B),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 20.w,
          ),
        ),
        primaryColor: const Color(0xff181E5B),
        canvasColor: Colors.white,
        disabledColor: const Color(0xFF9BAFB8),
        iconTheme: IconThemeData(
          color: allColors.canvasColor,
          size: 20.w,
        ),
        cardColor: allColors.canvasColor,
        buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.normal),
        textTheme: TextTheme(
            displayLarge: TextStyle(
                color: allColors.textColor,
                fontSize: 24.0.sp,
                fontWeight: FontWeight.bold),
            displayMedium: TextStyle(
                color: allColors.textColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
            displaySmall: TextStyle(
                color: allColors.textColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
            headlineMedium: TextStyle(
                color: allColors.textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
            headlineSmall: TextStyle(
                color: allColors.textColor,
                fontSize: 8.sp,
                fontWeight: FontWeight.bold),
            titleLarge: TextStyle(
                color: allColors.textColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold),
            labelLarge: TextStyle(
                color: allColors.canvasColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(
                color: allColors.textColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.normal),
            bodyMedium: TextStyle(
                color: allColors.textColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.normal), //paragraph
            titleMedium: TextStyle(
              color: allColors.textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            titleSmall: TextStyle(
                color: allColors.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
            labelMedium: TextStyle(
                color: allColors.textColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
            labelSmall: TextStyle(
                color: allColors.textColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
            bodySmall: TextStyle(
                color: allColors.textColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400)),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: const Color(0xff181E5B).withOpacity(0.4),
          selectionHandleColor: const Color(0xff181E5B),
          cursorColor: const Color(0xff181E5B),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return const Color(0xff181E5B).withOpacity(0.1);
                  } else {
                    return const Color(0xff181E5B);
                  }
                }),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r))),
                minimumSize: MaterialStateProperty.all(
                    Size(double.infinity, kButtonHeight)))),
        scaffoldBackgroundColor: Colors.white,
        dividerColor: const Color(0xFFe6e6e6),
        cardTheme: const CardTheme(color: Colors.white),
        colorScheme: ColorScheme.fromSwatch(
          errorColor: Colors.red,
        ).copyWith(error: const Color(0xFFFF4444)),
      );
}
