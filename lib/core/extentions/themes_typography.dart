import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ThemeTypography on BuildContext {
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get headlineLargeSemiMediumBold => Theme.of(this)
      .textTheme
      .headlineLarge!
      .copyWith(fontWeight: FontWeight.w500);
  TextStyle? get headlineMediumSemiMediumBold => Theme.of(this)
      .textTheme
      .headlineMedium!
      .copyWith(fontWeight: FontWeight.w500);
  TextStyle? get headlineSmallSemiMediumBold => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(fontWeight: FontWeight.w500);

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
  TextStyle? get hintStyle => Theme.of(this).inputDecorationTheme.hintStyle;
  TextStyle? get labelStyle => Theme.of(this).inputDecorationTheme.labelStyle;

  //HTML text theme style
  Style get htmlParagraphStyle => Style(
        color:
            Theme.of(this).colorScheme.onSurface, // Use your defined color here
        fontSize:
            FontSize(16.sp), // Use flutter_screenutil for responsive sizing
        fontWeight: FontWeight.w400,
        fontFamily: 'Tajawal',
      );
  Style get htmlTitleStyle => Style(
      color:
          Theme.of(this).colorScheme.onSurface, // Use your defined color here
      margin: Margins.zero,
      padding: HtmlPaddings.zero,
      textAlign: TextAlign.start,
      fontSize: FontSize(16.sp),
      fontWeight: FontWeight.w500,
      fontFamily: 'Tajawal');

  //Used For Text Colors
  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;
  Color get onSecondaryColor => Theme.of(this).colorScheme.onSecondary;
  Color get onBackgroundColor => Theme.of(this).colorScheme.onBackground;

  //Colors
  Color get onErrorColor => Theme.of(this).colorScheme.onError;
  Color get borderColor => Theme.of(this).colorScheme.outline;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get onSurfaceColor => Theme.of(this).colorScheme.onSurface;

  Color get onBackgroundGreyColor =>
      Theme.of(this).colorScheme.onBackground.withOpacity(0.5);

  //Background Colors
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get shaddowColor => Theme.of(this).colorScheme.shadow;

  //Primary and Secondary Color
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  ElevatedButtonThemeData get elevatedButtonThemeData =>
      Theme.of(this).elevatedButtonTheme;
  OutlinedButtonThemeData get outlinedButtonThemeData =>
      Theme.of(this).outlinedButtonTheme;
  BottomNavigationBarThemeData get bottomNavigationBarThemeData =>
      Theme.of(this).bottomNavigationBarTheme;
}
