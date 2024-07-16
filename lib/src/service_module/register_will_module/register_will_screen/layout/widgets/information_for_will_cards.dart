// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import '../../../../../../../core/constants/static_constants/static_constants.dart';

class InfoForWillItem extends StatelessWidget {
  final String icon;
  final String text;
  final String des;
  bool isDoc;
  bool isTimeline;

  InfoForWillItem({
    required this.icon,
    this.isTimeline = false,
    this.isDoc = false,
    this.des = '',
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (isTimeline) ...[
          Padding(
            padding: EdgeInsets.only(
                left: isArabic ? 10.h : 20.h,
                right: isArabic ? 20.h : 10.h,
                top: 10.h),
            child: Text(
              icon,
              style:
                  context.displayLarge?.copyWith(color: context.primaryColor),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isDoc) ...[
                  Padding(
                    padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h),
                    child: Text(
                      text,
                      style: context.headlineMedium?.copyWith(
                          color: allColors.lightTextColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h),
                    child: Text(
                      des,
                      style: context.headlineSmall?.copyWith(
                          color: allColors.lightTextColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ] else ...[
                  Padding(
                    padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h),
                    child: Text(
                      text,
                      style: context.bodyMedium?.copyWith(
                        color: allColors.lightTextColor,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ] else ...[
          Padding(
            padding: EdgeInsets.only(
                bottom: 5.h,
                left: isArabic ? 0 : 10.h,
                top: 5.h,
                right: isArabic ? 10.h : 0.h),
            child: Container(
              height: 44.h,
              width: 44.h,
              padding: EdgeInsets.all(2.h),
              child: Image.asset(
                icon,
                color: context.primaryColor,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h),
              child: Text(
                text,
                style: context.labelLarge
                    ?.copyWith(color: allColors.lightTextColor),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
