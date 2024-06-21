// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';

import '../../../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../../../core/constants/static_constants/static_constants.dart';

class InfoForWillItem extends StatelessWidget {
  final String icon;
  final String text;
  final String des;
  bool isTimeline;

  InfoForWillItem({
    required this.icon,
    this.isTimeline = false,
    this.des = '',
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 10.h),
      child: Container(
        padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
        decoration: BoxDecoration(
            border: Border.all(color: allColors.dividerColor, width: 1.w),
            borderRadius:
                BorderRadius.all(Radius.circular(isTimeline ? 6.r : 12.r))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (isTimeline) ...[
              Padding(
                padding: EdgeInsets.only(
                    bottom: 5.h,
                    left: isArabic ? 0 : 10.h,
                    top: 5.h,
                    right: isArabic ? 10.h : 0.h),
                child: Container(
                  alignment: Alignment.center,
                  height: 43.h,
                  width: 43.h,
                  decoration: BoxDecoration(
                      color: allColors.textColor,
                      borderRadius: BorderRadius.all(Radius.circular(60.r))),
                  padding: EdgeInsets.all(2.h),
                  child: CommonTextWidget(
                    color: allColors.canvasColor,
                    size: 18.sp,
                    align: TextAlign.start,
                    text: icon,
                    weight: FontWeight.w700,
                    padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonTextWidget(
                      color: allColors.lightTextColor,
                      size: 16.sp,
                      align: TextAlign.start,
                      text: text,
                      weight: FontWeight.w700,
                      padding:
                          EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h),
                    ),
                    CommonTextWidget(
                      color: allColors.lightTextColor,
                      size: 14.sp,
                      align: TextAlign.start,
                      text: des,
                      weight: FontWeight.w400,
                      padding:
                          EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h),
                    ),
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
                  ),
                ),
              ),
              Expanded(
                child: CommonTextWidget(
                  color: allColors.lightTextColor,
                  size: 18.sp,
                  align: TextAlign.start,
                  text: text,
                  weight: FontWeight.w500,
                  padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
