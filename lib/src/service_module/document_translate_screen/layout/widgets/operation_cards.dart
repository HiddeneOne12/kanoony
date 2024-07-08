// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';

class OperationCards extends StatelessWidget {
  String num;
  String title;
  OperationCards({super.key, required this.num, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        decoration: BoxDecoration(
            color: allColors.canvasColor,
            border: Border.all(color: allColors.textFieldColor, width: 2.w),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonTextWidget(
              color: allColors.primaryColor,
              size: 34.sp,
              align: TextAlign.center,
              text: num,
              weight: FontWeight.w800,
              padding: EdgeInsets.only(left: 16.h, right: 16.h),
            ),
            CommonTextWidget(
              color: allColors.lightTextColor,
              size: 16,
              align: TextAlign.center,
              text: title,
              weight: FontWeight.w400,
              maxLine: 2,
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
            ),
          ],
        ),
      ),
    );
  }
}
