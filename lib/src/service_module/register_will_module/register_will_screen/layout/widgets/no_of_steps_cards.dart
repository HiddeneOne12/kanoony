// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../../core/constants/static_constants/static_constants.dart';

class StepCards extends StatelessWidget {
  String text;
  String icon;
  StepCards({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 10.h),
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
            color: allColors.primaryColor,
            border: Border.all(color: allColors.primaryColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(6.r))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                decoration: BoxDecoration(
                    color: allColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(60.r))),
                child: Image.asset(
                  icon,
                  
                ),
              ),
            ),
            Expanded(
              child: CommonTextWidget(
                color: allColors.lightTextColor,
                size: 16,
                align: TextAlign.start,
                text: text,
                weight: FontWeight.w400,
                padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
