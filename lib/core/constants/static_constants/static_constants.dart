import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/src/dashboard_screen/layout/body.dart';
import 'package:kanoony/src/dashboard_screen/layout/dashboard_logged_in_screen.dart';
import 'package:kanoony/src/packages_screen/layout/body.dart';
import 'package:kanoony/src/service_module/service_screen/layout/body.dart';

var customPadding = EdgeInsets.only(left: 14.h, right: 14.h, top: 50.h);
var noPadding = EdgeInsets.all(0.h);

String apiHeaderKey = 'K@n0oNY@5758';
int index = 0;
bool isArabic = false;
List bodyItems = [
  const DashBoardBody(),
  ServicesBody(
    isHome: true,
  ),
  PackageBody(
    isHome: true,
  ),
  const LoggedInDashboardBody(),
];

class TextUtils {
  static String slug = 'slug';
  static String email = 'email';
  static String isBusiness = 'isBusiness';
  static String isOffshore = 'isOffshore';
  static String isMainland = 'isMainland';
  static String isFreeZone = 'isFreeZone';
  static String isTrademark = 'isTrademark';
}
