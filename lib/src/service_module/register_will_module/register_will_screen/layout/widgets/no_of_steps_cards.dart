// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

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
      padding: EdgeInsets.only(
        left: 16.h,
        right: 16.h,
      ),
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
              height: 40.h,
              width: 40.h,
              padding: EdgeInsets.all(2.h),
              child: Image.asset(
                icon,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h),
            child: Text(
              text,
              style: context.headlineMedium
                  ?.copyWith(color: allColors.lightTextColor),
            ),
          )),
        ],
      ),
    );
  }
}
