import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/src/dashboard_screen/layout/body.dart';
import 'package:kanoony/src/dashboard_screen/layout/dashboard_logged_in_screen.dart';
import 'package:kanoony/src/document_module/free_document_screen/layout/body.dart';
import 'package:kanoony/src/packages_screen/layout/body.dart';
import 'package:kanoony/src/service_module/service_screen/layout/body.dart';

var customPadding = EdgeInsets.only(left: 14.h, right: 14.h, top: 50.h);
var noPadding = EdgeInsets.all(0.h);

String apiHeaderKey = 'K@n0oNY@5758';
int index = 0;
bool isArabic = false;
List bodyItems = [
  const DashBoardBody(),
  FreeDocumentBody(
    isHome: true,
  ),
  PackageBody(
    isHome: true,
  ),
  ServicesBody(
    isHome: true,
  ),
  const LoggedInDashboardBody(),
];

class TextUtils {
  static String slug = 'slug';
  static String email = 'email';
}

class MenuDocsSlugs {
  static String contractTemplates = 'contract-templates';
  static String businessTemplates = 'business_templates';
  static String ndaTemplates = 'nda_templates';
  static String noticeTemplates = 'notice-templates';
  static String policyTemplates = 'ploicy-templates';
  static String attornyTemplates = 'power_of_attorney_templates';
  static String shareHolderTemplates = 'shareholders_templates';
  static String termsTemplates = 'terms-privacy-templates';
}
