import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';

showSnackBarMessage(
    {required String content,
    required backgroundColor,
    required contentColor}) {
  ScaffoldMessenger.of(RoutesUtils.context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      margin: EdgeInsets.only(
        bottom: 10.w,
        left: 10.w,
        right: 10.w,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.r))),
      backgroundColor: backgroundColor,
      content: Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: Text(
          content,
          style: Theme.of(RoutesUtils.context)
              .textTheme
              .headlineMedium!
              .copyWith(
                  fontWeight: FontWeight.w600,
                  color: contentColor,
                  fontSize: 16.sp),
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          overflow: TextOverflow.visible,
        ),
      )));
}
