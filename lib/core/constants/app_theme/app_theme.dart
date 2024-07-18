import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../object_constants/object_constants.dart';

class AppTheme {
  Color boxShadowColor = const Color(0xffCDBDBD);
  Color surfaceColor = const Color(0xffF5F5F5);
  Color primaryColor = const Color.fromRGBO(235, 169, 0, 1);
  Color secondryColor = const Color.fromRGBO(25, 59, 72, 1);

  //TODO @abdullah please replace var data type with Color
  var textColor = const Color.fromRGBO(25, 59, 72, 1);
  var dividerColor = const Color.fromRGBO(0, 0, 0, 0.2);
  var lightTextColor = const Color.fromRGBO(0, 0, 0, 1);
  var blackColor = Colors.black;
  var whiteColor = Colors.white;
  var blueColor = const Color.fromRGBO(13, 110, 253, 1);
  var drawerDividerColor = const Color.fromRGBO(0, 0, 0, 0.15);
  var borderColor = const Color.fromRGBO(46, 91, 109, 1);
  var errorColor = Colors.red;
  var successColor = Colors.green;
  var transparentColor = Colors.transparent;
  var scaffoldColor = const Color.fromRGBO(247, 245, 245, 1);
  var shimmerBaseColor = Colors.grey[300];
  var shimmerHighlightColor = Colors.grey[100];
  var greyTextColor = const Color.fromRGBO(135, 135, 135, 1);
  var lightGreyColor = Color.fromARGB(255, 204, 201, 201);
  var darkGreyColor = const Color.fromRGBO(229, 235, 238, 1);
  var textFieldColor = const Color.fromRGBO(247, 245, 245, 1);
  var popUpTextFieldTextColor = const Color.fromRGBO(156, 156, 156, 1);
  var popUpTextFieldBorderColor = const Color.fromRGBO(204, 204, 204, 1);
  var popUpTextFieldFillColor = const Color.fromRGBO(245, 245, 245, 1);
  var buttonBorderColor = const Color.fromRGBO(179, 194, 200, 1);
  var popUpColor = const Color.fromRGBO(255, 255, 255, 1);
  var lightBlueColor = const Color.fromRGBO(235, 248, 252, 1);
  var disabledColor = const Color.fromRGBO(222, 222, 222, 1);
  var dropdownItemColor = const Color.fromRGBO(25, 59, 72, 0.7);
  var lightDividerColor = const Color.fromRGBO(0, 0, 0, 0.09);
  var visaColor = const Color.fromRGBO(69, 194, 177, 1);
  var drawerColor = const Color.fromRGBO(237, 245, 248, 1);

  // Color textColor = Colors.black;
  // Color primaryColor = const Color(0xff94ABFF);
  // Color secondryColor = const Color(0xff394B84);
  // Color scaffoldBGColor = Colors.white;
  // Color blackColor = const Color(0xff08202D);
  // Color borderColor = const Color(0xffE3E3E3);
  // Color whiteColor = const Color(0xffFFFFFF);
  // Color redClr = const Color(0xffFB3F3F);
  // Color boxShadowColor = const Color(0xffCDBDBD);
  // Color greyColor = const Color(0xff8B8B8B);
  // Color filledColor = const Color.fromARGB(255, 237, 234, 234);
  // Color hintColor = const Color(0xffE3E3E3);
  // Color primaryLightColor = const Color(0xffE9EEFF);
  // Color primaryMediumColor = const Color(0xffCBD6F7);
  // Color surfaceColor = const Color(0xffF5F5F5);
  // Color mediumLightDarkGreenClr = const Color(0xff62B934);
  // Color darkGreenClr = const Color(0xff218380);
  // Color mediumDarkGreenClr = const Color(0xff62B934);
  // Color skyBlueClr = const Color(0xff87FFFE);
  // Color darkBlueClr = const Color(0xff394B84);
  // Color yellowClr = const Color(0xffFBB13C);
  // Color lightGreenClr = const Color(0xff99FC49);
  // ///Comments Avatar Colors
  // Color mediumLightGreenClr = const Color(0xffB0E57C);
  // Color mediumTealClr = const Color(0xff56BAEC);
  // Color lightTeal = const Color(0xffB4D8E7);
  // Color purpleClr = const Color(0xffC575D3);
  // Color blueClr = const Color(0xff478EE4);
  // Color limeClr = const Color(0xffB5DB40);
  // Color tealClr = const Color(0xff4DCBC5);
  // Color greenClr = const Color.fromARGB(255, 108, 197, 112);
  double kButtonHeight = 48.h;
  ThemeData lightTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ThemeData(
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
        ///For Large Headings
        displayLarge: TextStyle(
            letterSpacing: 0.1,
            fontSize: 28.0.sp,
            fontWeight: FontWeight.bold,
            height: 1.17),
        displayMedium: TextStyle(
            letterSpacing: 0.1,
            fontSize: 24.0.sp,
            fontWeight: FontWeight.bold,
            height: 1.17),
        displaySmall: TextStyle(
            letterSpacing: 0.1,
            fontSize: 22.0.sp,
            fontWeight: FontWeight.bold,
            height: 1.17),

        ///For Headings
        headlineLarge: TextStyle(
            letterSpacing: 0.1,
            fontSize: 20.0.sp,
            fontWeight: FontWeight.bold,
            height: 1.17),
        headlineMedium: TextStyle(
            letterSpacing: 0.1,
            fontSize: 18.0.sp,
            fontWeight: FontWeight.bold,
            height: 1.17),
        headlineSmall: TextStyle(
            letterSpacing: 0.1,
            fontSize: 16.0.sp,
            fontWeight: FontWeight.bold,
            height: 1.17),

        ///For Sub Headings
        titleLarge: TextStyle(
            letterSpacing: 0.1,
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w500,
            height: 1.17),
        titleMedium: TextStyle(
            letterSpacing: 0.1,
            fontSize: 17.0.sp,
            fontWeight: FontWeight.w500,
            height: 1.17),
        titleSmall: TextStyle(
            letterSpacing: 0.1,
            fontSize: 15.0.sp,
            fontWeight: FontWeight.w500,
            height: 1.17),

        ///For Body Text
        bodyLarge: TextStyle(
          fontSize: 16.0.sp,
          height: 1.30,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0.sp,
          letterSpacing: 0.1,
          height: 1.17,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontSize: 12.0.sp,
          letterSpacing: 0.1,
          height: 1.17,
          fontWeight: FontWeight.w400,
        ),

        ///For label ans captions etc
        labelLarge: TextStyle(
            letterSpacing: 0.1,
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w500,
            height: 1.17),
        labelMedium: TextStyle(
            letterSpacing: 0.1,
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w500,
            height: 1.17),
        labelSmall: TextStyle(
            letterSpacing: 0.1,
            fontSize: 11.0.sp,
            fontWeight: FontWeight.w400,
            height: 1.17),
      ),
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
      colorScheme: theme.colorScheme.copyWith(
          surface: surfaceColor,
          onSurface: textColor,
          error: errorColor,
          secondary: secondryColor,
          onBackground: textColor,
          outline: borderColor,
          primary: primaryColor,
          onSecondary: whiteColor,
          onPrimary: whiteColor,
          onError: errorColor,
          shadow: boxShadowColor.withOpacity(0.2)),
    );
  }
}
